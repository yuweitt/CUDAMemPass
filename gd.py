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

def main():
    total_execution_time = 0
    HtoD = 0
    Exec = 0
    DtoH = 0
    for i in range(0, 11):
        # try:
        proc = subprocess.Popen(['./run'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        # except:
        #     continue
        if i == 0:
            continue
        result = proc.stdout.read().decode('utf-8')
        time = re.findall("\d+\.\d+", result)
        print(time[-1])
        total_execution_time += float(time[-1])
        # HtoD += float(time[2])
        # Exec += float(time[3])
        # DtoH += float(time[4])
    # average.append(execution_time/10)
    # print("\t Total", total_execution_time/10, file = fp)
    print("\t Total", total_execution_time/10)

    # x = list(map(str, ADVICE_DEVICE))
    # plt.bar(x, average)
    # plt.title('Device')
    # plt.ylabel('Execution Time')
    # plt.xlabel('Device')
    # plt.savefig('Device_time.png')

if __name__ == '__main__':
    main()