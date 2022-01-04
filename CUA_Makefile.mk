all: um

# flag
DEBUG = -g -v
OPTAPP = -O0
OPT = -O2 -std=c++11
CFLAGS = --cuda-gpu-arch=sm_61 -L /usr/local/cuda/lib64/ -lcudart_static -ldl -lrt -pthread
GC = g++ -std=c++11 #for unordered_map

# path
SM =sm_61
CP =compute_61
LLVM = /home/yuweitt/llvm-project/
PASS =$(LLVM)/build/lib/CUDAMemPass.so
UPATH =$(LLVM)/llvm/lib/Transforms/CUDAMem/


SRC = um.cu
EXE = um

# host side
host.cui: $(SRC)
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -E --cuda-host-only $(SRC) -o host.cui
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -c --cuda-host-only -emit-llvm $(SRC) -o host.clean.bc
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -c -S --cuda-host-only -emit-llvm $(SRC) -o host.clean.ll

# device side
device.clean.bc:  $(SRC)
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -c --cuda-device-only -emit-llvm $(SRC) -o device.clean.bc

# same
device.ptx: device.clean.bc
	llc  -march=nvptx64 -mcpu=sm_61 -mattr=+ptx64 device.clean.bc -o device.ptx
#	llc  -march=nvptx64 -mcpu=sm_61 -mattr=+ptx64 device.clean.bc -filetype=asm -o device.ptx

# same
device.o :  device.ptx
	ptxas --gpu-name $(SM) device.ptx -o device.o

device.fatbin: device.o host.cui 
	fatbinary --cuda -64 --create device.fatbin --image=profile=$(SM),file=device.o --image=profile=$(CP),file=device.ptx -link

host.bc: device.fatbin host.cui 
	clang -cc1 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple nvptx64-nvidia-cuda  -emit-llvm-bc -emit-llvm-uselists -mrelax-all -disable-free -disable-llvm-verifier -discard-value-names -main-file-name um.cu -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -fdeprecated-macro -fdebug-compilation-dir /home/yuweitt/cuda/um -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -fcuda-include-gpubinary device.fatbin -faddrsig -o host.bc -x cuda um.cu
# clang -cc1 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple -main-file-name um.cu -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0  nvptx64-nvidia-cuda -emit-llvm-bc -emit-llvm-uselists -disable-free -main-file-name $(SRC) -mrelocation-model static -mthread-model posix -fmath-errno -masm-verbose -mconstructor-aliases -munwind-tables -fuse-init-array -target-cpu x86-64 -v -dwarf-column-info -debug-info-kind=limited -dwarf-version=4 -debugger-tuning=gdb -resource-dir $(LLVM)/build/lib/clang/10.0.0 $(OPT) -fdeprecated-macro -ferror-limit 19 -fmessage-length 0 -pthread -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -disable-llvm-passes -fcuda-include-gpubinary device.fatbin -o host.bc -x cuda um.cu	
#-x cuda-cpp-output host.cui
# -mdisable-fp-elim 
hosti.bc: host.bc  $(PASS)
	opt -load $(PASS) -cudamem < host.bc > hosti.bc
#	opt -load lib/CUDAMemPass.so -cudamem < ~/cuda/um/um.ll > /dev/null

hosti.o: hosti.bc
	clang++ hosti.bc -c

um: hosti.o 
	clang++ $(DEBUG) $(AUXOBJ) hosti.o -o $(EXE) -L /usr/local/cuda/lib64/ -lcudart_static -ldl -lcuda -lrt -pthread -lcudart

clean:
	rm -f *.o *.bc *.s *.ptx *.cui *.fatbin *.ll