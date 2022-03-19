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
import matplotlib.pyplot as plt
import argparse



cudaPrefetchName = "cudaMemPrefetchAsync"
cudaAdviseName = "cudaMemAdvise"
ReadMostly = "cudaMemAdviseSetReadMostly"
PreferredLocation = "cudaMemAdviseSetPreferredLocation"
AccessedBy = "cudaMemAdviseSetAccessedBy"

cudaVarList = []
cudaVarSizeList = []
cudaVarLineNum = []

def parse_args():
    parser = argparse.ArgumentParser(prog='argparse_template.py', description='Tutorial') 
    parser.add_argument('--text', '-t', default='test', type=str, required=False, help='Text for repeated')
    parser.add_argument('--prefetch-size', '-n', default='1024', type=int, required=False, help='Cuda Prefetch Size')
    parser.add_argument('--advice-num', action='append', type=str, required=False, help='Which to add cudaMemAdvise')
    parser.add_argument('--prefetch-num', action='append', type=str, required=False, help='Which to add cudaMemPrefetchAsync')
    return parser.parse_args()

def genAdviseFunc(AdviceObj, AdviceSize, AdviceType):
    idx = AdviceObj.find("&") + 1
    return "\t" + cudaAdviseName + "(" + AdviceObj[idx:] + ", " + str(AdviceSize) + ", " + AdviceType + ", 0);\n"

def genPrefetchFunc(PrefetchObj, PrefetchSize):
    idx = PrefetchObj.find("&") + 1
    return "\t" + cudaPrefetchName + "(" + PrefetchObj[idx:] + ", " + str(PrefetchSize) + ", 0);\n"

def main():
    FileName = "bfs"
    PREFETCH_SIZE = 1024
    PREFETCH_DISTANCE = 20
    ADVICE_TYPE = 3
    ADVICE_SIZE = 4096


    cuFile = open(FileName + ".cu","r")
    lines = cuFile.readlines()
    kernel_line_number = 0
    for line_number, line in enumerate(lines):
        if "cudaMalloc" in line:
            cudaVarLineNum.append(line_number)
            print("Line number : " + str(line_number) + "," + line)
            start = line.find('(') + 1
            mid = line.find(',')
            end = line.rfind(')')
            cudaVarList.append(line[start:mid])
            cudaVarSizeList.append(line[mid+1:end])

        if "<<<" in line:
            kernel_line_number = number
            print("Line number : " + str(line_number) + "," + line)

    adviceFunc = genAdviseFunc(cudaVarList[0], cudaVarSizeList[0], ReadMostly)
    prefetchFunc = genPrefetchFunc(cudaVarList[0], PREFETCH_SIZE)

    lines.insert(kernel_line_number, adviceFunc)
    lines.insert(kernel_line_number, prefetchFunc)
    print(cudaVarList)
    print(cudaVarSizeList)

    # with open(FileName + ".inst.cu", "w") as f:
    #     contents = f.writelines(lines)


if __name__ == '__main__':
    args = parse_args()
    main()