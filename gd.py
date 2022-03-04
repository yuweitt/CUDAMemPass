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
    # PREFETCH_SIZE = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384]
    DEVICE_OPTION = [0, 1]
    ADVICE_OPTION = [0, 1, 3, 5]
    ADVICE_DEVICE = ["0-0", "0-1", "1-0", "1-1", "3-0", "3-1", "5-0", "5-1"]
    PREFETCH_DISTANCE = range(74)
    TARGET_LIST = ADVICE_OPTION
    average = []
    fp = open("Prefetch_Distance_Time.txt", "a")
    for target in TARGET_LIST:
        for device in DEVICE_OPTION:
            execution_time = 0
            make_cmd = "make -f CHAI_Makefile.mk ADVICE={0} DEVICE={1}".format(target, device)
            # make_cmd = "make -f CHAI_Makefile.mk SIZE={0}".format(target)
            # make_cmd = "make -f CHAI_Makefile.mk ADVICE={0}".format(target)
            os.system(make_cmd)
            # print(make_cmd)
            for i in range(1, 11):
                try:
                    proc = subprocess.Popen(['./main'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                except:
                    continue
                result = proc.stdout.read().decode('utf-8')
                if("error" in result):
                    continue
                time = re.findall("\d+\.\d+", result)
                print(time[-1])
                execution_time += float(time[-1])
            average.append(execution_time/10)
            print(target, execution_time/10, file = fp)
            print(target, execution_time/10)
    fp.close()

    x = list(map(str, ADVICE_DEVICE))
    plt.bar(x, average)
    plt.title('Device')
    plt.ylabel('Execution Time')
    plt.xlabel('Device')
    plt.savefig('Device_time.png')

if __name__ == '__main__':
    main()