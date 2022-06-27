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
import matplotlib.pyplot as plt
from collections import defaultdict

cudaPrefetchName = "cudaMemPrefetchAsync"
cudaAdviseName = "cudaMemAdvise"
# ReadMostly = "cudaMemAdviseSetReadMostly"
# PreferredLocation = "cudaMemAdviseSetPreferredLocation"
# AccessedBy = "cudaMemAdviseSetAccessedBy"

cudaVarList = []
cudaVarSizeList = []
cudaVarLineNum = []
AdviseType = ["Default", "cudaMemAdviseSetReadMostly", "cudaMemAdviseSetPreferredLocation", "cudaMemAdviseSetAccessedBy"]
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
    return "\t" + cudaAdviseName + "(" + AdviceObj + ", " + str(AdviceSize) + ", " + AdviseType[TypeNum] + ", " + DEVICE[DeviceNum] + ");\n"

def genPrefetchFunc(PrefetchObj, PrefetchSize):
    # idx = PrefetchObj.find("&") + 1
    return "\t" + cudaPrefetchName + "(" + PrefetchObj + ", " + str(PrefetchSize) + ", 0);\n"

def getPrefetchObj(line):
    start = line.find('(') + 1
    end = line.rfind(')')
    arg_line = line[start:end].replace(" ", "")
    return arg_line.split(',')

def getPrefetchFuncList(kernelObj, prefetchDict):
    prefetchList = []
    for obj in kernelObj:
        try:
            idx = cudaVarList.index(obj)
            if prefetchDict and idx in prefetchDict:
                # pConfig = prefetchDict[idx].split("_")
                # prefetchList.append(genPrefetchFunc(obj, pConfig[0]))
                prefetchList.append(genPrefetchFunc(obj, cudaVarSizeList[idx]))
        except:
            pass
    return prefetchList

def getVar(line):
    line = line.replace(" ", "")
    start = line.find('&') + 1
    mid = line.find(',')
    end = line.rfind(')')
    cudaVarList.append(line[start:mid])
    cudaVarSizeList.append(line[mid+1:end])
    return line[start:mid], line[mid+1:end]

def main():
    FileName = "srad"
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
    for line_number, line in enumerate(lines):
        if "<<<" in line:
            kernel_line_number = line_number
            kernelObj = getPrefetchObj(line)
            # print(kernelObj)
            prefetchFuncList = getPrefetchFuncList(kernelObj, prefetchDict)
            for pf in prefetchFuncList:
                print(pf)
                outFile.write(pf)
            outFile.write(line)
            continue
        outFile.write(line)
    inFile.close()
    tmpFile.close()
    outFile.close()


if __name__ == '__main__':
    args = parse_args()
    main()