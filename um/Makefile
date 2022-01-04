BIN_FILE=um
SRC_FILE=$(BIN_FILE).cu

main: $(BIN_FILE)

# Host Side
$(BIN_FILE).ll: $(SRC_FILE) $(BIN_FILE).fatbin
	clang++ -std=c++11 $(BIN_FILE).cu -m64 --cuda-host-only -relocatable-pch -Xclang -fcuda-include-gpubinary -Xclang $(BIN_FILE).fatbin -S -g -c -emit-llvm

$(BIN_FILE).o: $(BIN_FILE).ll
	llc $(BIN_FILE).ll -o $(BIN_FILE).s
	clang++ -c -Wall $(BIN_FILE).s -o $(BIN_FILE).o

# GPU Side
$(BIN_FILE)-cuda-nvptx64-nvidia-cuda-sm_61.ll: $(SRC_FILE)
	clang++ -x cuda -std=c++11 $(BIN_FILE).cu --cuda-device-only --cuda-gpu-arch=sm_61 -S -g -emit-llvm

$(BIN_FILE).ptx: $(BIN_FILE)-cuda-nvptx64-nvidia-cuda-sm_61.ll
	llc -march=nvptx64 -mcpu=sm_61 -mattr=+ptx64 $(BIN_FILE)-cuda-nvptx64-nvidia-cuda-sm_61.ll -o $(BIN_FILE).ptx

$(BIN_FILE).ptx.o: $(BIN_FILE).ptx
	ptxas -m64 --gpu-name=sm_61 $(BIN_FILE).ptx -o $(BIN_FILE).ptx.o

$(BIN_FILE).fatbin: $(BIN_FILE).ptx.o
	fatbinary --64 --create $(BIN_FILE).fatbin --image=profile=sm_61,file=$(BIN_FILE).ptx.o --image=profile=compute_61,file=$(BIN_FILE).ptx -link

$(BIN_FILE)_dlink.o: $(BIN_FILE).fatbin
	nvcc $(BIN_FILE).fatbin -gencode arch=compute_61,code=sm_61 -dlink -o $(BIN_FILE)_dlink.o -lcudart -lcudart_static -lcudadevrt

# Link both object files together (either nvcc or clang works here):
# $(BIN_FILE): $(BIN_FILE).o 
# 	nvcc $(BIN_FILE).o $(BIN_FILE)_dlink.o -o $(BIN_FILE) -arch=sm_61
# $(BIN_FILE): $(BIN_FILE).o $(BIN_FILE)_dlink.o
#	nvcc $(BIN_FILE).o $(BIN_FILE)_dlink.o -o $(BIN_FILE) -arch=sm_61 -v


clean:
	rm -f *.o *.bc *.s *.ptx *.cui *.fatbin *.ll $(BIN_FILE)
