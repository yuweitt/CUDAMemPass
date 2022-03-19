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


cudaPrefetchName = "cudaMemPrefetchAsync"
cudaAdviseName = "cudaMemAdvise"
cudaVarList = []


def genAdviseFunc(AdviceObj, AdviceSize, AdviceType):
    idx = AdviceObj.find("&") + 1
    return "\t" + cudaAdviseName + "(" + AdviceObj[idx:] + ", " + str(AdviceSize) + ", " + AdviceType + ", 0);\n"

def genPrefetchFunc(PrefetchObj, PrefetchSize):
    idx = PrefetchObj.find("&") + 1
    return "\t" + cudaPrefetchName + "(" + PrefetchObj[idx:] + ", " + str(PrefetchSize) + ", 0);\n"

def main():
    PREFETCH_SIZE = 1024
    PREFETCH_DISTANCE = 20
    ADVICE_TYPE = 3
    ADVICE_SIZE = 4096

    ReadMostly = "cudaMemAdviseSetReadMostly"
    PreferredLocation = "cudaMemAdviseSetPreferredLocation"
    AccessedBy = "cudaMemAdviseSetAccessedBy"
    # PREFETCH_SIZE = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384]
    # PrefetchFunc = 
    # AdviseFunc = cudaAdviseName + "(" + AdviceObj + "," + AdviceSize + "," + 
    cuFile = open("um.cu","r")
    lines = cuFile.readlines()
    line_number = 0
    kernel_line_number = 0
    for number, line in enumerate(lines):
        if "cudaMalloc" in line:
            line_number = number
            print("Line number : " + str(line_number) + "," + line)
            # regex = re.compile(r"\(*\,")
            # match = regex.search(line)
            # regex = r"&(_*)[a-zA-Z]+(\d*)"
            start = line.find('(') + 1
            end = line.find(',')
            regex = r"^[a-zA-Z_$][a-zA-Z_$0-9]*$"
            # print(line[start:end])
            
            string = re.search(regex, line)
            cudaVarList.append(line[start:end])

        if "<<<" in line:
            kernel_line_number = number
            print("Line number : " + str(line_number) + "," + line)

    adviceFunc = genAdviseFunc(cudaVarList[0], ADVICE_SIZE, ReadMostly)
    prefetchFunc = genPrefetchFunc(cudaVarList[0], PREFETCH_SIZE)

    lines.insert(kernel_line_number, adviceFunc)
    lines.insert(kernel_line_number, prefetchFunc)
    print(cudaVarList)

    with open("um_inst.cu", "w") as f:
        contents = f.writelines(lines)


if __name__ == '__main__':
    main()