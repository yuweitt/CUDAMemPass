#!/usr/bin/env python
#
# Optimize blocksize of apps/mmm_block.cpp
#
# This is an extremely simplified version meant only for tutorials
#
from __future__ import print_function

import os
import re
import subprocess
import datetime
import argparse
from collections import defaultdict

cudaPrefetchName = "cudaMemPrefetchAsync"
cudaAdviseName = "cudaMemAdvise"
# ReadMostly = "cudaMemAdviseSetReadMostly"
# PreferredLocation = "cudaMemAdviseSetPreferredLocation"
# AccessedBy = "cudaMemAdviseSetAccessedBy"

cudaVarList = []
cudaVarSizeList = []
cudaVarLineNum = []
AdviseType = ["Default", "cudaMemAdviseSetReadMostly", "cudaMemAdviseSetPreferredLocation", "cudaMemAdviseSetAccessedBy"\
            , "cudaMemAdviseUnsetReadMostly", "cudaMemAdviseUnsetPreferredLocation", "cudaMemAdviseUnsetAccessedBy"]
DEVICE = ["0", "cudaCpuDeviceId"]

def parse_args():
    parser = argparse.ArgumentParser(prog='argparse_template.py', description='CUDA Parameter') 
    parser.add_argument('--advice_type', '-t', default='cudaMemAdviseSetReadMostly', type=str, required=False, help='Which type of cuda memory advice')
    parser.add_argument('--prefetch_size', '-n', default='1024', type=int, required=False, help='Cuda Prefetch Size')
    parser.add_argument('--advice_num', '-a', action='append', type=str, required=False, help='Which to add cudaMemAdvise')
    parser.add_argument('--prefetch_num', '-p', action='append', type=str, required=False, help='Which to add cudaMemPrefetchAsync')
    return parser.parse_args()

def parseAdvice():
    adviceDict = dict()
    if args.advice_num:
        for item in args.advice_num:
            advice = item.split("_", 1)
            adviceDict[int(advice[0])] = advice[1]
    return adviceDict

def parsePrefetch():
    prefetchDict = {}
    if args.prefetch_num:
        for item in args.prefetch_num:
            prefetch = item.split("_", 1)
            prefetchDict[int(prefetch[0])] = prefetch[1]
    return prefetchDict

def genAdviseFunc(cudaVarCount, adviceDict):
    advConfig = adviceDict[cudaVarCount].split("_")
    TypeNum = int(advConfig[0])
    DeviceNum = int(advConfig[1])
    AdviceObj = cudaVarList[cudaVarCount]
    AdviceSize = cudaVarSizeList[cudaVarCount]
    # idx = AdviceObj.find("&") + 1
    return genAdviseFuncName(AdviceObj, AdviceSize, TypeNum, DeviceNum)
    

def genAdviseFuncName(AdviceObj, AdviceSize, TypeNum, DeviceNum):
    return "\t" + cudaAdviseName + "(" + AdviceObj + ", " + str(AdviceSize) + ", " + AdviseType[TypeNum] + ", " + DEVICE[DeviceNum] + ");\n"

def genPrefetchFuncName(PrefetchObj, PrefetchSize):
    # idx = PrefetchObj.find("&") + 1
    return "\t" + cudaPrefetchName + "(" + PrefetchObj + ", " + str(PrefetchSize) + ", 0);\n"

def getPrefetchObj(line):
    start = line.find('(') + 1
    end = line.rfind(')')
    arg_line = line[start:end].replace(" ", "")
    return arg_line.split(',')

def getPrefetchFuncList(kernelObj, prefetchDict):
    prefetchList = []
    # print(prefetchDict)
    # if prefetchDict:
    #     for idx in prefetchDict:
    #         pConfig = prefetchDict[idx].split("_")
    #         prefetchList.append(genPrefetchFuncName(cudaVarList[idx], pConfig[0]))
    for obj in kernelObj:
        try:
            idx = cudaVarList.index(obj)
            if prefetchDict and idx in prefetchDict:
                pConfig = prefetchDict[idx].split("_")
                # prefetchList.append(genPrefetchFuncName(obj, cudaVarSizeList[idx]))
                prefetchList.append(genPrefetchFuncName(obj, pConfig[0]))
        except:
            pass
    return prefetchList

def getResetAdviceList(kernelCount, adviceDict):
    resetList = []
    if adviceDict:
        for idx in adviceDict:
            advConfig = adviceDict[idx].split("_")
            TypeNum = int(advConfig[0])
            DeviceNum = int(advConfig[1])
            ResetNum = int(advConfig[2])
            AdviceObj = cudaVarList[idx]
            AdviceSize = cudaVarSizeList[idx]
            if TypeNum != 0 and ResetNum == kernelCount:
                resetList.append(genAdviseFuncName(AdviceObj, AdviceSize, TypeNum + 3, DeviceNum))
    return resetList



def getVar(line):
    line = line.replace(" ", "")
    start = line.find('&') + 1
    mid = line.find(',')
    end = line.rfind(')')
    cudaVarList.append(line[start:mid])
    cudaVarSizeList.append(line[mid+1:end])
    return line[start:mid], line[mid+1:end]

def main():
    FileName = "main"
    inFile = open(FileName + ".cu","r")
    tmpFile = open(FileName + ".tmp.cu", "w+")
    outFile = open(FileName + ".inst.cu", "w+")
    lines = inFile.readlines()

    advice_type = args.advice_type
    kernel_line_number = 0
    cudaVarCount = 0
    adviceDict = parseAdvice()
    prefetchDict = parsePrefetch()

    for line_number, line in enumerate(lines):
        if "cudaMalloc" in line:
            tmpFile.write(line)
            cudaVarLineNum.append(line_number)
            var, size = getVar(line)
            if adviceDict and cudaVarCount in adviceDict:
                adviceFunc = genAdviseFunc(cudaVarCount, adviceDict)
                print(adviceFunc)
                tmpFile.write(adviceFunc)
            cudaVarCount += 1
            continue
        tmpFile.write(line)
    # print(cudaVarList)
    tmpFile.close()
    tmpFile = open(FileName + ".tmp.cu", "r")
    lines = tmpFile.readlines()
    kernel_count = 0
    for line_number, line in enumerate(lines):
        if "<<<" in line:
            kernel_count += 1
            kernel_line_number = line_number
            kernelObj = getPrefetchObj(line)
            prefetchFuncList = getPrefetchFuncList(kernelObj, prefetchDict)
            resetAdviceList = getResetAdviceList(kernel_count, adviceDict)
            for pf in prefetchFuncList:
                print(pf)
                outFile.write(pf)
            for ra in resetAdviceList:
                print(ra)
                outFile.write(ra)
            outFile.write(line)
            continue
        outFile.write(line)
    inFile.close()
    tmpFile.close()
    outFile.close()


if __name__ == '__main__':
    args = parse_args()
    main()