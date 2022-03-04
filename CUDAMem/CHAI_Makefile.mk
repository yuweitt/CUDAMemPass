all: main kernel.cpp.o

SRC = main.cpp
EXE = main

CXX = "/home/yuweitt/llvm-project/build/bin/clang-10"
PTX = "/usr/local/cuda-10.2/bin/ptxas"
LD = "/usr/bin/ld"

# Default Value
DISTANCE = 20
SIZE = 512
ADVICE = 0
DEVICE = 1

cls:
	rm -f *.o *.bc *.s *.ptx *.cui *.fatbin *.ll main

kernel.cpp.o: kernel.cpp cls
	$(CXX) -cc1 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple nvptx64-nvidia-cuda -emit-obj -mrelax-all -disable-free -disable-llvm-verifier -discard-value-names -main-file-name kernel.cpp -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -std=c++11 -fdeprecated-macro -fdebug-compilation-dir /home/yuweitt/chai/CUDA-U/BS -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -faddrsig -o kernel.cpp.o -x c++ kernel.cpp

kernel.cu.s: kernel.cu
	$(CXX) -cc1 -triple nvptx64-nvidia-cuda -aux-triple x86_64-unknown-linux-gnu -S -disable-free -disable-llvm-verifier -discard-value-names -main-file-name kernel.cu -mrelocation-model static -mthread-model posix -mframe-pointer=all -fno-rounding-math -no-integrated-as -fcuda-is-device -mlink-builtin-bitcode /usr/local/cuda-10.2/nvvm/libdevice/libdevice.10.bc -target-feature +ptx64 -target-sdk-version=10.1 -target-cpu sm_61 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -std=c++11 -fdeprecated-macro -fno-dwarf-directory-asm -fno-autolink -fdebug-compilation-dir /home/yuweitt/chai/CUDA-U/BS -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -o kernel.cu.s -x cuda kernel.cu

kernel.cutmp.o: kernel.cu.s
	$(PTX) -m64 -O0 -v --gpu-name sm_61 --output-file kernel.cutmp.o kernel.cu.s

kernel.cu.fatbin: kernel.cutmp.o
	fatbinary -64 --create kernel.cu.fatbin --image=profile=sm_61,file=kernel.cutmp.o --image=profile=compute_61,file=kernel.cu.s

kernel.cu.o: kernel.cu kernel.cu.fatbin
	$(CXX) -cc1 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple nvptx64-nvidia-cuda -emit-obj -mrelax-all -disable-free -disable-llvm-verifier -discard-value-names -main-file-name kernel.cu -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -std=c++11 -fdeprecated-macro -fdebug-compilation-dir /home/yuweitt/chai/CUDA-U/BS -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -fcuda-include-gpubinary kernel.cu.fatbin -faddrsig -o kernel.cu.o -x cuda kernel.cu

main.bc: main.cpp
	$(CXX) -cc1 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple nvptx64-nvidia-cuda -emit-llvm-bc -mrelax-all -disable-free -disable-llvm-verifier -discard-value-names -main-file-name main.cpp -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -std=c++11 -fdeprecated-macro -fdebug-compilation-dir /home/yuweitt/chai/CUDA-U/BS -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -faddrsig -o main.bc -x c++ main.cpp

main.ll: main.bc
	llvm-dis main.bc -o main.ll

main.i.bc: main.bc main.ll
	opt -load ~/llvm-project/build/lib/CUDAMemPass.so -cudamem \
	-distance $(DISTANCE) -size $(SIZE) -advice $(ADVICE) -device $(DEVICE) main.bc -o main.i.bc
# opt -load ~/llvm-project/build/lib/CUDAMemPass.so -cudamem -distance 2 ~/chai/CUDA-U/BS/main.bc -o ~/chai/CUDA-U/BS/main.i.bc
# opt -load ~/llvm-project/build/lib/CUDAMemPass.so -cudamem -distance 9 -size 4096 -advice 0 main.bc -o main.i.bc

main.i.ll: main.i.bc
	llvm-dis main.i.bc -o main.i.ll

main.o: main.i.bc main.i.ll
	$(CXX) main.i.bc -c -o main.o

main: kernel.cpp.o kernel.cu.o main.o main.ll
	$(LD) -z relro --hash-style=gnu --eh-frame-hdr -m elf_x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o main /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../x86_64-linux-gnu/crt1.o /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../x86_64-linux-gnu/crti.o /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/crtbegin.o -L/usr/local/cuda/lib64/ -L/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0 -L/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../x86_64-linux-gnu -L/lib/x86_64-linux-gnu -L/lib/../lib64 -L/usr/lib/x86_64-linux-gnu -L/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../.. -L/home/yuweitt/llvm-project/build/bin/../lib -L/lib -L/usr/lib kernel.cpp.o kernel.cu.o main.o -lcudart_static -ldl -lrt -lstdc++ -lm -lgcc_s -lgcc -lpthread -lc -lgcc_s -lgcc /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/crtend.o /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../x86_64-linux-gnu/crtn.o
	rm kernel.cpp.o
clean:
	rm -f *.o *.bc *.s *.ptx *.cui *.fatbin *.ll *.tmp main
	rm ~/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers/new


