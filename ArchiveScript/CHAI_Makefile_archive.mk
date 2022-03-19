all: main

# flag
DEBUG = -g -v
OPTAPP = -O0
OPT = -O2 -std=c++11
CFLAGS = --cuda-gpu-arch=sm_61 -L /usr/local/cuda/lib64/ -lcudart_static -ldl -lrt -pthread -std=c++11
# GC = g++ -std=c++11 #for unordered_map

# path
SM =sm_61
CP =compute_61
LLVM = /home/yuweitt/llvm-project/
PASS =$(LLVM)/build/lib/CUDAMemPass.so
UPATH =$(LLVM)/llvm/lib/Transforms/CUDAMem/


CU = kernel.cu
CPP = kernel.cpp
SRC = main.cu
EXE = main

AUXOBJ = kernel-cpu.o 


# ansf.bc :  $(ANSF) $(UPATH)/../common.h  $(UPATH)/types.h
# 	clang++ $(DEBUG) $(OPT) -c --cuda-device-only -emit-llvm $(ANSF) -o ansf.bc

# host side
host.cui: $(SRC)
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -E --cuda-host-only $(SRC) -o host.cui
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -c --cuda-host-only -emit-llvm $(SRC) -o host.clean.bc
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -c -S --cuda-host-only -emit-llvm $(SRC) -o host.clean.ll

# Device side bitcode
device.clean.bc:  $(SRC)
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -c --cuda-device-only -emit-llvm $(SRC) -o device.clean.bc

kernel-cu.bc: kernel.cu
	clang++ $(DEBUG) $(OPT) -c --cuda-gpu-arch=sm_61 --cuda-device-only -emit-llvm kernel.cu -o kernel-cu.bc

# Link two bitcode
device-link.bc: kernel-cu.bc device.clean.bc
	llvm-link kernel-cu.bc device.clean.bc -o=device-link.bc

# Generate ptx code
device.ptx: device-link.bc
	llc  -march=nvptx64 -mcpu=sm_61 -mattr=+ptx64 device-link.bc -o device.ptx
#	llc  -march=nvptx64 -mcpu=sm_61 -mattr=+ptx64 device.clean.bc -filetype=asm -o device.ptx

# Generate object file from ptx code
device.o :  device.ptx
	ptxas --gpu-name $(SM) device.ptx -o device.o

# Generate fatbin from device object file and host cui file
device.fatbin: device.o host.cui 
	fatbinary --cuda -64 --create device.fatbin --image=profile=$(SM),file=device.o --image=profile=$(CP),file=device.ptx -link

# Generate cpu kernel object file
kernel-cpu.o: kernel.cpp
# clang++ -c -lcudart_static --cuda-gpu-arch=sm_61 -L /usr/local/cuda/lib64/ kernel.cpp -o kernel-cpu.o
	nvcc -c -std=c++11 -arch=sm_61 -L/usr/lib/ -L/usr/local/cuda/lib64 -lm -I/usr/local/cuda/include kernel.cpp -o kernel-cpu.o


# kernel-cu.fatbin: kernel.cu
# 	nvcc --fatbin -std=c++11 -arch=sm_61 -L/usr/lib/ -L/usr/local/cuda/lib64 -lm -I/usr/local/cuda/include kernel.cu -o kernel-cu.fatbin



host.bc: device.fatbin host.cui
	clang -cc1 -std=c++11 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple nvptx64-nvidia-cuda  -emit-llvm-bc -emit-llvm-uselists -mrelax-all -disable-free -disable-llvm-verifier -discard-value-names -main-file-name um.cu -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -fdeprecated-macro -fdebug-compilation-dir /home/yuweitt/cuda/um -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -fcuda-include-gpubinary device.fatbin -faddrsig -o host.bc -x cuda main.cu
# clang -cc1 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple -main-file-name um.cu -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0  nvptx64-nvidia-cuda -emit-llvm-bc -emit-llvm-uselists -disable-free -main-file-name $(SRC) -mrelocation-model static -mthread-model posix -fmath-errno -masm-verbose -mconstructor-aliases -munwind-tables -fuse-init-array -target-cpu x86-64 -v -dwarf-column-info -debug-info-kind=limited -dwarf-version=4 -debugger-tuning=gdb -resource-dir $(LLVM)/build/lib/clang/10.0.0 $(OPT) -fdeprecated-macro -ferror-limit 19 -fmessage-length 0 -pthread -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -disable-llvm-passes -fcuda-include-gpubinary device.fatbin -o host.bc -x cuda um.cu	
#-x cuda-cpp-output host.cui
# -mdisable-fp-elim 
hosti.bc: host.bc  $(PASS)
	opt -load $(PASS) -cudamem  host.bc -o hosti.bc
#	opt -load lib/CUDAMemPass.so -cudamem < ~/cuda/um/um.ll > /dev/null

hosti.o: hosti.bc
	clang++ hosti.bc -c

main: hosti.o kernel-cpu.o
	clang++ $(DEBUG) $(AUXOBJ) hosti.o -o $(EXE) -L /usr/local/cuda/lib64/ -lcudart_static -ldl -lcuda -lrt -pthread -lcudart

clean:
	rm -f *.o *.bc *.s *.ptx *.cui *.fatbin *.ll