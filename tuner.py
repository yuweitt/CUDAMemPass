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
# from opentuner import ConfigurationManipulator
# from opentuner import IntegerParameter
# from opentuner import PowerOfTwoParameter
from opentuner.search import manipulator
from opentuner import MeasurementInterface
from opentuner import Result

cudaVariableNum = 7 - 1

ADVICE_NUM = ['advice_{}'.format(i) for i in range(0, cudaVariableNum)]
PREFETCH_NUM = ['prefetch_{}'.format(i) for i in range(0, cudaVariableNum)]
ADVICE_OPTION = ['cudaMemAdviseSetReadMostly', 'cudaMemAdviseSetPreferredLocation', 'cudaMemAdviseSetAccessedBy']
print(ADVICE_NUM)
print(PREFETCH_NUM)


# From https://github.com/jansel/opentuner/blob/master/examples/mario/mario.py
def call_time():
    try:
        total_execution_time = 0
        for i in range(1, 11):
            proc = subprocess.Popen(['./run'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            result = proc.stdout.read().decode('utf-8')
            time = re.findall("\d+\.\d+", result)
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
            m.add_parameter(manipulator.EnumParameter(idx,['on', 'off']))

        for idx in PREFETCH_NUM:
            m.add_parameter(manipulator.EnumParameter(idx,['on', 'off']))
        m.add_parameter(
            manipulator.IntegerParameter('MEM_ADVICE', 0, 2))
        m.add_parameter(
            manipulator.IntegerParameter('PREFETCH_DISTANCE', 1, 68))
        m.add_parameter(
            manipulator.PowerOfTwoParameter('PREFETCH_SIZE', 4, 65536))
        return m

    def run(self, desired_result, input, limit):
        """
        Compile and run a given configuration then
        return performance
        """
        cfg = desired_result.configuration.data
        python_cmd = 'python cudaScript.py '
        python_cmd += '--advice_type {0} '.format(ADVICE_OPTION[cfg['MEM_ADVICE']])
        python_cmd += '--prefetch_size {0} '.format(cfg['PREFETCH_SIZE'])
        python_cmd += '--advice_num '
        for idx in ADVICE_NUM:
            if cfg[idx] == 'on':
                num = idx[-1]
                python_cmd += '{0} '.format(num)
        python_cmd += '--prefetch_num '
        for idx in PREFETCH_NUM:
            if cfg[idx] == 'on':
                num = idx[-1]
                python_cmd += '{0} '.format(num)
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
        print(exe_time)
        print("\t Average Execution Time: " + str(exe_time))
        if exe_time == 9999:
            return Result(time=FAIL_PENALTY)
        return Result(time=exe_time)


    def save_final_config(self, configuration):
        """called at the end of tuning"""
        print("Optimal prefetch distance to bs_final_config.json:", configuration.data)
        self.manipulator().save_to_file(configuration.data,
                                        'bs_final_config.json')

if __name__ == '__main__':
    FAIL_PENALTY   = 9999
    argparser = opentuner.default_argparser()
    PrefetchTuner.main(argparser.parse_args())
