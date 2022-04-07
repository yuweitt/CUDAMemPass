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
    # HtoD = 0
    # Exec = 0
    # DtoH = 0
    for i in range(0, 11):
        proc = subprocess.Popen(['./run'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        result = proc.stdout.read().decode('utf-8')
        time = re.findall("\d+\.\d+", result)
        print(i)
        print(time[-1])
        if i == 0:
            continue
        total_execution_time += float(time[-1])
        # HtoD += float(time[2])
        # Exec += float(time[3])
        # DtoH += float(time[4])
    print("\t Total", total_execution_time/10)

if __name__ == '__main__':
    main()