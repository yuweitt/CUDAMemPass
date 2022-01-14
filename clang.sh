# clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)
# Target: x86_64-unknown-linux-gnu
# Thread model: posix
# InstalledDir: /usr/bin
# Found candidate GCC installation: /usr/bin/../lib/gcc/i686-linux-gnu/8
# Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/6
# Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/6.5.0
# Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/7
# Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0
# Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/8
# Found candidate GCC installation: /usr/lib/gcc/i686-linux-gnu/8
# Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/6
# Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/6.5.0
# Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/7
# Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/7.5.0
# Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/8
# Selected GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0
# Candidate multilib: .;@m64
# Selected multilib: .;@m64
# Found CUDA installation: /usr/local/cuda-10.2, version 10.1

# kernel.cpp
# clang-10: warning: Unknown CUDA version 10.2. Assuming the latest supported version 10.1 [-Wunknown-cuda-version]
#  "/home/yuweitt/llvm-project/build/bin/clang-10" /tmp/kernel-e9bd0d.o
"/home/yuweitt/llvm-project/build/bin/clang-10" -cc1 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple nvptx64-nvidia-cuda -emit-obj -mrelax-all -disable-free -disable-llvm-verifier -discard-value-names -main-file-name kernel.cpp -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -std=c++11 -fdeprecated-macro -fdebug-compilation-dir /home/yuweitt/chai/CUDA-U/BS -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -faddrsig -o kernel.cpp.o -x c++ kernel.cpp
# clang -cc1 version 10.0.0 based upon LLVM 10.0.0 default target x86_64-unknown-linux-gnu
# ignoring nonexistent directory "/include"
# ignoring nonexistent directory "/include"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward"
# ignoring duplicate directory "/usr/local/include"
# ignoring duplicate directory "/home/yuweitt/llvm-project/build/lib/clang/10.0.0/include"
# ignoring duplicate directory "/usr/include/x86_64-linux-gnu"
# ignoring duplicate directory "/usr/include"
#include "..." search starts here:
#include <...> search starts here:
#  /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers
#  /usr/local/cuda-10.2/include
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward
#  /usr/local/include
#  /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include
#  /usr/include/x86_64-linux-gnu
#  /usr/include
# End of search list.


# kernel.cu emit assembly to ptx
#  "/home/yuweitt/llvm-project/build/bin/clang-10" /tmp/kernel-8753b6.s
"/home/yuweitt/llvm-project/build/bin/clang-10" -cc1 -triple nvptx64-nvidia-cuda -aux-triple x86_64-unknown-linux-gnu -S -disable-free -disable-llvm-verifier -discard-value-names -main-file-name kernel.cu -mrelocation-model static -mthread-model posix -mframe-pointer=all -fno-rounding-math -no-integrated-as -fcuda-is-device -mlink-builtin-bitcode /usr/local/cuda-10.2/nvvm/libdevice/libdevice.10.bc -target-feature +ptx64 -target-sdk-version=10.1 -target-cpu sm_61 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -std=c++11 -fdeprecated-macro -fno-dwarf-directory-asm -fno-autolink -fdebug-compilation-dir /home/yuweitt/chai/CUDA-U/BS -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -o kernel.cu.s -x cuda kernel.cu
# clang -cc1 version 10.0.0 based upon LLVM 10.0.0 default target x86_64-unknown-linux-gnu
# ignoring nonexistent directory "/include"
# ignoring nonexistent directory "/include"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward"
# ignoring duplicate directory "/usr/local/include"
# ignoring duplicate directory "/home/yuweitt/llvm-project/build/lib/clang/10.0.0/include"
# ignoring duplicate directory "/usr/include/x86_64-linux-gnu"
# ignoring duplicate directory "/usr/include"
#include "..." search starts here:
#include <...> search starts here:
#  /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers
#  /usr/local/cuda-10.2/include
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward
#  /usr/local/include
#  /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include
#  /usr/include/x86_64-linux-gnu
#  /usr/include
# End of search list.

# ptxas
#  "/usr/local/cuda-10.2/bin/ptxas" /tmp/kernel-c269c1.o /tmp/kernel-8753b6.s
"/usr/local/cuda-10.2/bin/ptxas" -m64 -O0 -v --gpu-name sm_61 --output-file kernel.cutmp.o kernel.cu.s
# ptxas info    : 27 bytes gmem
# ptxas info    : Compiling entry function '_Z14Bezier_surfaceifiiiiP3XYZS0_Pi' for 'sm_61'
# ptxas info    : Function properties for _Z14Bezier_surfaceifiiiiP3XYZS0_Pi
#     544 bytes stack frame, 0 bytes spill stores, 0 bytes spill loads
# ptxas info    : Used 34 registers, 368 bytes cmem[0], 56 bytes cmem[2]
# ptxas info    : Function properties for _Z14BezierBlendGPUidi
#     0 bytes stack frame, 0 bytes spill stores, 0 bytes spill loads
# ptxas info    : Function properties for _Z18partitioner_createifPiS_
#     0 bytes stack frame, 0 bytes spill stores, 0 bytes spill loads
# ptxas info    : Function properties for _Z8gpu_morePK11Partitioner
#     0 bytes stack frame, 0 bytes spill stores, 0 bytes spill loads
# ptxas info    : Function properties for _Z8gpu_nextP11Partitioner
#     0 bytes stack frame, 0 bytes spill stores, 0 bytes spill loads
# ptxas info    : Function properties for _Z9gpu_firstP11Partitioner
#     0 bytes stack frame, 0 bytes spill stores, 0 bytes spill loads
# ptxas info    : Function properties for _ZL16atomicAdd_systemPii
#     0 bytes stack frame, 0 bytes spill stores, 0 bytes spill loads
# ptxas info    : Function properties for __internal_accurate_pow
#     0 bytes stack frame, 0 bytes spill stores, 0 bytes spill loads
#  "/usr/local/cuda-10.2/bin/fatbinary" /tmp/kernel-3a08f0.fatbin /tmp/kernel-c269c1.o /tmp/kernel-8753b6.s
fatbinary -64 --create kernel.cu.fatbin --image=profile=sm_61,file=kernel.cutmp.o --image=profile=compute_61,file=kernel.cu.s
# "/home/yuweitt/llvm-project/build/bin/clang-10" /tmp/kernel-3a08f0.fatbin /tmp/kernel-04bfcd.o
"/home/yuweitt/llvm-project/build/bin/clang-10" -cc1 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple nvptx64-nvidia-cuda -emit-obj -mrelax-all -disable-free -disable-llvm-verifier -discard-value-names -main-file-name kernel.cu -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -std=c++11 -fdeprecated-macro -fdebug-compilation-dir /home/yuweitt/chai/CUDA-U/BS -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -fcuda-include-gpubinary kernel.cu.fatbin -faddrsig -o kernel.cu.o -x cuda kernel.cu
# clang -cc1 version 10.0.0 based upon LLVM 10.0.0 default target x86_64-unknown-linux-gnu
# ignoring nonexistent directory "/include"
# ignoring nonexistent directory "/include"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward"
# ignoring duplicate directory "/usr/local/include"
# ignoring duplicate directory "/home/yuweitt/llvm-project/build/lib/clang/10.0.0/include"
# ignoring duplicate directory "/usr/include/x86_64-linux-gnu"
# ignoring duplicate directory "/usr/include"
#include "..." search starts here:
#include <...> search starts here:
#  /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers
#  /usr/local/cuda-10.2/include
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward
#  /usr/local/include
#  /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include
#  /usr/include/x86_64-linux-gnu
#  /usr/include
# End of search list.

# main.cpp
# "/home/yuweitt/llvm-project/build/bin/clang-10"    /tmp/main-1b7c87.o -emit-obj 
"/home/yuweitt/llvm-project/build/bin/clang-10" -cc1 -triple x86_64-unknown-linux-gnu -target-sdk-version=10.1 -aux-triple nvptx64-nvidia-cuda -emit-llvm-bc -mrelax-all -disable-free -disable-llvm-verifier -discard-value-names -main-file-name main.cpp -mrelocation-model static -mthread-model posix -mframe-pointer=all -fmath-errno -fno-rounding-math -masm-verbose -mconstructor-aliases -munwind-tables -target-cpu x86-64 -dwarf-column-info -fno-split-dwarf-inlining -debugger-tuning=gdb -v -resource-dir /home/yuweitt/llvm-project/build/lib/clang/10.0.0 -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers -internal-isystem /usr/local/cuda-10.2/include -include __clang_cuda_runtime_wrapper.h -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0 -internal-isystem /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -internal-isystem /usr/local/include -internal-isystem /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include -internal-externc-isystem /usr/include/x86_64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -std=c++11 -fdeprecated-macro -fdebug-compilation-dir /home/yuweitt/chai/CUDA-U/BS -ferror-limit 19 -fmessage-length 0 -pthread -fgnuc-version=4.2.1 -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -faddrsig -o main.bc -x c++ main.cpp
# clang -cc1 version 10.0.0 based upon LLVM 10.0.0 default target x86_64-unknown-linux-gnu
# ignoring nonexistent directory "/include"
# ignoring nonexistent directory "/include"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0"
# ignoring duplicate directory "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward"
# ignoring duplicate directory "/usr/local/include"
# ignoring duplicate directory "/home/yuweitt/llvm-project/build/lib/clang/10.0.0/include"
# ignoring duplicate directory "/usr/include/x86_64-linux-gnu"
# ignoring duplicate directory "/usr/include"
#include "..." search starts here:
#include <...> search starts here:
#  /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include/cuda_wrappers
#  /usr/local/cuda-10.2/include
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0
#  /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/backward
#  /usr/local/include
#  /home/yuweitt/llvm-project/build/lib/clang/10.0.0/include
#  /usr/include/x86_64-linux-gnu
#  /usr/include
# End of search list.
#  "/usr/bin/ld" 
# opt -load /home/yuweitt/llvm-project/build/lib/CUDAMemPass.so -cudamem main.bc -o main.i.bc
"/home/yuweitt/llvm-project/build/bin/clang-10" main.bc -c -o main.o
"/usr/bin/ld"  -z relro --hash-style=gnu --eh-frame-hdr -m elf_x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o main /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../x86_64-linux-gnu/crt1.o /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../x86_64-linux-gnu/crti.o /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/crtbegin.o -L/usr/local/cuda/lib64/ -L/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0 -L/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../x86_64-linux-gnu -L/lib/x86_64-linux-gnu -L/lib/../lib64 -L/usr/lib/x86_64-linux-gnu -L/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../.. -L/home/yuweitt/llvm-project/build/bin/../lib -L/lib -L/usr/lib kernel.cpp.o kernel.cu.o main.o -lcudart_static -ldl -lrt -lstdc++ -lm -lgcc_s -lgcc -lpthread -lc -lgcc_s -lgcc /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/crtend.o /usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../x86_64-linux-gnu/crtn.o

