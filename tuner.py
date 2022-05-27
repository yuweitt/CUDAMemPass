#!/usr/bin/env python
#
# Optimize blocksize of apps/mmm_block.cpp
#
# This is an extremely simplified version meant only for tutorials
#
from __future__ import print_function

import os
import traceback
import sys
import opentuner
import subprocess
import re
import datetime
import math
import json
from opentuner.search import manipulator
from opentuner import MeasurementInterface
from opentuner import Result

EXE_MIN = 999999
FILE_DATE = ""
PY_CMD = ""
TUNE_ITER = 3
cudaVariableNum = 6
basicBlockNum = 33
maxPrefetchSize = 65536
DEVICE = ["0", "cudaCpuDeviceId"]
ADVICE_NUM = ['advice_{}'.format(i) for i in range(0, cudaVariableNum)]
ADVICE_DEVICE = ['device_{}'.format(i) for i in range(0, cudaVariableNum)]
PREFETCH_SIZE = ['prefetch_{}'.format(i) for i in range(0, cudaVariableNum)]
PREFETCH_DISTANCE = ['distance_{}'.format(i) for i in range(0, cudaVariableNum)]

# From https://github.com/jansel/opentuner/blob/master/examples/mario/mario.py
def call_time():
    try:
        total_execution_time = 0
        for i in range(0, TUNE_ITER + 1):
            proc = subprocess.Popen(['./run'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            result = proc.stdout.read().decode('utf-8')
            time = re.findall("\d+\.\d+", result)
            print(i)
            print(time[-1])
            if i == 0:
                continue
            total_execution_time += float(time[-1])
        return total_execution_time/TUNE_ITER
    except:
        print("\t Failed to execute.")
        return 999999

def main():
    global FILE_DATE
    dt = datetime.datetime.today()
    FILE_DATE = dt.strftime("%Y_%m_%d_%H-%M-")
    dirName = "time/"
    if not os.path.exists(dirName):
        os.mkdir(dirName)

class PrefetchTuner(MeasurementInterface):
    def manipulator(self):
        """
        Define the search space by creating a
        ConfigurationManipulator
        """
        m = opentuner.ConfigurationManipulator()
        for idx in ADVICE_DEVICE:
            m.add_parameter(manipulator.IntegerParameter(idx, 0, 1))
        for idx in ADVICE_NUM:
            m.add_parameter(manipulator.IntegerParameter(idx, 0, 3))
        for idx in PREFETCH_SIZE:
            m.add_parameter(manipulator.PowerOfTwoParameter(idx, 16, maxPrefetchSize))
        m.add_parameter(manipulator.IntegerParameter('PREFETCH_DISTANCE', 0, basicBlockNum))
        return m

    def run(self, desired_result, input, limit):
        """
        Compile and run a given configuration then
        return performance
        //////////////////////////////////////////////////////////////////////////////
        Sample python command
        python cudaScript.py --advice_num 5_1_0 --prefetch_num 0_512_20
        Which means
        advice fifth object, using first advice option, pin to GPU device 0
        prefetch zero'th object, with prefetch size 512 and prfetch distance 20
        """
        global EXE_MIN, PY_CMD
        cfg = desired_result.configuration.data
        python_cmd = 'python cudaScript.py '
        for idx, item in enumerate(ADVICE_NUM):
            if cfg[item] == 0:
                continue
            else:
                python_cmd += ' --advice_num '
                num = item[-1]
                python_cmd += '{0} '.format(num + "_" + str(cfg[item]) + "_" + str(cfg[ADVICE_DEVICE[idx]]))
        
        for idx, item in enumerate(PREFETCH_SIZE):
            # Don't prefetch
            if cfg[item] == 16:
                continue
            else:
                python_cmd += ' --prefetch_num '
                num = item[-1]
                python_cmd += '{0} '.format(num + "_" + str(cfg[item]) + "_" + str(cfg['PREFETCH_DISTANCE']))
        
        print(python_cmd)
        os.system(python_cmd)
        os.system('make clean')
        os.system('make')
        # make_cmd = 'make -f CHAI_Makefile.mk DISTANCE={0}'.format(cfg['PREFETCH_DISTANCE'])
        # os.system('make -f CHAI_Makefile.mk clean')
        # os.system(make_cmd)
        

        dirName = "time/"
        exeName = dirName + FILE_DATE + "time.txt"
        exe_time = call_time()

        with open(exeName, "a") as f:
            f.write(str(exe_time) + "\n")

        if exe_time < EXE_MIN:
            EXE_MIN = exe_time
            PY_CMD = python_cmd
        print(exe_time)
        print("\t Average Execution Time: " + str(exe_time))
        return Result(time=exe_time)


    def save_final_config(self, configuration):
        """called at the end of tuning"""
        global EXE_MIN, PY_CMD, FILE_DATE
        dirName = 'json/'
        if not os.path.exists(dirName):
            os.mkdir(dirName)
        config_name = dirName + FILE_DATE + 'config.json'
        print("Optimal config save to final_config.json:", configuration.data)
        self.manipulator().save_to_file(configuration.data, config_name)
        with open(config_name) as f:
            data = json.load(f)
        data.update({"exe_time":EXE_MIN, "python_cmd":PY_CMD})
        with open(config_name, 'w+') as f:
            json.dump(data, f)

if __name__ == '__main__':
    main()
    argparser = opentuner.default_argparser()
    PrefetchTuner.main(argparser.parse_args())
