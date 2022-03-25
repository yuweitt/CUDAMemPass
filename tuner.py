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

EXE_MIN = 9999
PY_CMD = ""
cudaVariableNum = 7 - 1
ADVICE_NUM = ['advice_{}'.format(i) for i in range(0, cudaVariableNum)]
PREFETCH_SIZE = ['prefetch_{}'.format(i) for i in range(0, cudaVariableNum)]
PREFETCH_DISTANCE = ['distance_{}'.format(i) for i in range(0, cudaVariableNum)]
# ADVICE_OPTION = ['cudaMemAdviseSetReadMostly', 'cudaMemAdviseSetPreferredLocation', 'cudaMemAdviseSetAccessedBy']

# From https://github.com/jansel/opentuner/blob/master/examples/mario/mario.py
def call_time():
    try:
        total_execution_time = 0
        for i in range(1, 11):
            proc = subprocess.Popen(['./run'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            result = proc.stdout.read().decode('utf-8')
            time = re.findall("\d+\.\d+", result)
            print(time[-1])
            total_execution_time += float(time[-1])
        return total_execution_time/10
    except:
        print("\t Failed to execute.")
        return 9999

class PrefetchTuner(MeasurementInterface):
    def manipulator(self):
        """
        Define the search space by creating a
        ConfigurationManipulator
        """
        m = opentuner.ConfigurationManipulator()
        for idx in ADVICE_NUM:
            m.add_parameter(manipulator.IntegerParameter(idx, 0, 3))
        for idx in PREFETCH_SIZE:
            m.add_parameter(manipulator.PowerOfTwoParameter(idx, 16, 65536))
        for idx in PREFETCH_DISTANCE:
            m.add_parameter(manipulator.IntegerParameter(idx, 0, 20))
        # m.add_parameter(
        #     manipulator.IntegerParameter('MEM_ADVICE', 0, 2))
        # m.add_parameter(
        #     manipulator.IntegerParameter('PREFETCH_DISTANCE', 1, 68))
        # m.add_parameter(
        #     manipulator.PowerOfTwoParameter('PREFETCH_SIZE', 4, 65536))
        return m

    def run(self, desired_result, input, limit):
        """
        Compile and run a given configuration then
        return performance
        //////////////////////////////////////////////////////////////////////////////
        Sample python command
        python cudaScript.py --advice_num 5_1 --prefetch_num 0_512_20
        Which means
        advice fifth object, using first advice option
        prefetch zero'th object, with prefetch size 512 and prfetch distance 20
        """
        global EXE_MIN, PY_CMD
        cfg = desired_result.configuration.data
        python_cmd = 'python cudaScript.py '
        # python_cmd += '--advice_type {0} '.format(ADVICE_OPTION[cfg['MEM_ADVICE']])
        # python_cmd += '--prefetch_size {0} '.format(cfg['PREFETCH_SIZE'])
        for item in ADVICE_NUM:
            if cfg[item] == 0:
                continue
            else:
                python_cmd += '--advice_num '
                num = item[-1]
                python_cmd += '{0} '.format(num + "_" + str(cfg[item]))
        
        for idx, item in enumerate(PREFETCH_SIZE):
            # Don't prefetch
            if cfg[item] == 16:
                continue
            else:
                python_cmd += '--prefetch_num '
                num = item[-1]
                python_cmd += '{0} '.format(num + "_" + str(cfg[item]) + "_" + str(cfg[PREFETCH_DISTANCE[idx]]))
        
        # for idx in PREFETCH_NUM:
        #     if cfg[idx] == 'on':
        #         python_cmd += '--prefetch_num '
        #         num = idx[-1]
        #         python_cmd += '{0} '.format(num)
        print(python_cmd)
        os.system(python_cmd)
        os.system('make clean')
        os.system('make')
        # gcc_cmd = 'g++ mmm_block.cpp '
        # gcc_cmd += ' -D{0}={1}'.format('BLOCK_SIZE', cfg['BLOCK_SIZE'])
        # gcc_cmd += ' -o ./tmp.bin'
        # make_cmd = 'make -f CHAI \n'
        # make -f CHAI_Makefile.mk CNT=40 SIZE=4096 ADVICE=1
        # make_cmd = 'make -f CHAI_Makefile.mk DISTANCE={0} SIZE={1} ADVICE={2}'\
        #     .format(cfg['PREFETCH_DISTANCE'], cfg['PREFETCH_SIZE'], cfg['MEM_ADVICE'])

        # make_cmd = 'make -f CHAI_Makefile.mk DISTANCE={0} SIZE={1}'\
        #     .format(cfg['PREFETCH_DISTANCE'], cfg['PREFETCH_SIZE'])
        # make_cmd = 'make -f CHAI_Makefile.mk '
        # make_cmd += 'DISTANCE=' + str(PREFETCH_DISTANCE)
        # compile_result = self.call_program(run_cmd)
        # print(python_cmd)
        # assert compile_result['returncode'] == 0

        exe_time = call_time()
        if exe_time < EXE_MIN:
            EXE_MIN = exe_time
            PY_CMD = python_cmd
        print(exe_time)
        print("\t Average Execution Time: " + str(exe_time))
        return Result(time=exe_time)


    def save_final_config(self, configuration):
        """called at the end of tuning"""
        global EXE_MIN, PY_CMD
        dirName = 'json/'
        if not os.path.exists(dirName):
            os.mkdir(dirName)
        dt = datetime.datetime.today()
        dt_format = dt.strftime("%Y_%m_%d_%H-%M-")
        config_name = dirName + dt_format + 'config.json'
        print("Optimal config save to final_config.json:", configuration.data)
        self.manipulator().save_to_file(configuration.data, config_name)
        with open(config_name) as f:
            data = json.load(f)
        data.update({"exe_time":EXE_MIN, "python_cmd":PY_CMD})
        with open(config_name, 'w+') as f:
            json.dump(data, f)

if __name__ == '__main__':
    argparser = opentuner.default_argparser()
    PrefetchTuner.main(argparser.parse_args())
