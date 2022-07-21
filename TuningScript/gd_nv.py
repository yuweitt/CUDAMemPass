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

def getTime(line, idx=1):
    line = line.replace("GPU activities:", "")
    lst = line.split()
    time_str = lst[idx]
    time_lst = re.findall("[-+]?(?:\d*\.\d+|\d+)", time_str)
    print(lst)
    time = float(time_lst[-1])
    if "us" in time_str:
        exe_time = time * 0.001
    elif "ms" not in time_str:
        print(time_str)
        exe_time = time * 1000
    else:
        exe_time = time
    return exe_time

def main():
    total_execution_time = 0
    time_str = ""
    kernelName = ["cuInsertionSort", "cuComputeDistanceGlobal", "cuParallelSqrt"]
    for i in range(0, 11):
        proc = subprocess.Popen(['nvprof --profile-child-processes ./run'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
        lines = proc.stdout.readlines()
        exe_time = 0
        for line in lines:
                line = str(line, 'utf-8')
                for item in kernelName:
                    if item in line:
                        exe_time += getTime(line)
        #### 
        print(i)
        print(exe_time)
        if i == 0:
            continue
        total_execution_time += float(exe_time)
        ####
    print("\t Total", total_execution_time/10)

if __name__ == '__main__':
    main()