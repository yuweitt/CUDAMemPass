#include <llvm/Pass.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/DebugInfo.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/DebugInfoMetadata.h> // for DI...
#include <llvm/IR/CFG.h>

#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/ADT/iterator_range.h>

#include <llvm/Transforms/IPO/PassManagerBuilder.h>

#include <llvm/Support/raw_ostream.h>
#include "llvm/Support/CommandLine.h" 

#include <llvm/CodeGen/RegAllocRegistry.h>

#include <llvm/Analysis/BasicAliasAnalysis.h>
#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/ValueTracking.h>

#include <vector>
#include <string>
#include <unordered_set>
#include <unordered_map>

using namespace std;
using namespace llvm;


// User dfeined variable to specify distance from main
static cl::opt<unsigned>
  PrefetchDistance(
    "distance", cl::desc("Specify Prefetch Distance"), cl::value_desc("Prefetch Distance")
  );
static cl::opt<unsigned>
PrefetchSize(
  "size", cl::desc("Specify Prefetch Size"), cl::value_desc("Prefetch Size")
);
static cl::opt<unsigned>
AdviseOption(
  "advice", cl::desc("Specify Advise Option"), cl::value_desc("Advise Option")
);
static cl::opt<unsigned>
DeviceNum(
  "device", cl::desc("Specify CPU or GPU Device"), cl::value_desc("Device Number")
);


namespace {
  struct cudaMem : public FunctionPass {
    int num_of_malloc_managed;
    int prefetchOprandIndex;
    unsigned int bbFromBegin;
    static char ID;
    bool isInit;
    static string kernelName;
    static string cudaMallocManagedName;
    static string cudaPrefetchName;
    static string cudaLaunchKernelName;
    static string cudaMemAdviseName;
    static string GaussianKernelName;
    static string SobelKernelName;
    cudaMem() : FunctionPass(ID) {
      isInit = false;
      num_of_malloc_managed = 0;
      bbFromBegin = 0;
      prefetchOprandIndex = 9;
    }
    
    void insertPrefetchBB(Function *func, Instruction *inst) {
      Module* module = func->getParent();
      LLVMContext& context = func->getContext();
      Function* cuda_prefetch_func = NULL;
      for (auto mod_func = module->begin(); mod_func != module->end(); mod_func++) {
        if (mod_func->getName().str().find(cudaPrefetchName) != string::npos) {
            // if(mod_func->isDeclaration())
              // errs() << "\t cudaMemPrefetchAsync Delcaration Found !!" << "\n";
              errs() << "\t Definition Found !! : " << cudaPrefetchName << "\n";
            cuda_prefetch_func = &(*mod_func);
            break;
        }
      }

      Function* cuda_advise_func = NULL;
      for (auto mod_func = module->begin(); mod_func != module->end(); mod_func++) {
        if (mod_func->getName().str().find(cudaMemAdviseName) != string::npos) {
            // if(mod_func->isDeclaration())
              // errs() << "\t cudaMemPrefetchAsync Delcaration Found !!" << "\n";
              errs() << "\t Definition Found !! : " << cudaMemAdviseName << "\n";
            cuda_advise_func = &(*mod_func);
            break;
        }
      }

      errs() << "\t Basic Block Count : " << PrefetchDistance << "\n";
      errs() << "\t Basic Block From Begin : " << bbFromBegin << "\n";
      // Check if 
      if(PrefetchDistance > bbFromBegin)
        PrefetchDistance = bbFromBegin -1;
      else if(PrefetchDistance < 1)
        PrefetchDistance = 1;

      // Determine which basic block to insert prefetch instruction
      unsigned int cnt = 0;
      Instruction *InsertionPoint;
      for(auto bb = func->begin() ; bb != func->end() ; bb++) {
        if(cnt >= (bbFromBegin - PrefetchDistance)) {
        // if(cnt >= 5){
          // int instCount = std::distance(bb->begin(), bb->end());
          // if(instCount <= 2)
          //   continue;
          InsertionPoint = &(*bb->begin());
          if(InsertionPoint->getOpcode() == Instruction::LandingPad)
            continue;
          break;
        }
        cnt++;
      }

      IRBuilder <> builder(InsertionPoint);
      if(nullptr != (inst)) {
        errs() << "\t Instruction Name : " << (inst)->getOpcodeName() << "\n";
        errs() << "\t Operand Numbers : " << (inst)->getNumOperands() << "\n";
      }


      // ********************************** //
      // Newly added 
      std::stack<Value*> SearchStack;
      std::vector<Instruction*> Inst2Insert;

      Value* _pVal;
      _pVal = cast<InvokeInst>(inst)->getArgOperand(prefetchOprandIndex);
      // auto *ldInst = dyn_cast<llvm::Instruction>(_pVal);
      SearchStack.push(_pVal);
      Inst2Insert.push_back(dyn_cast<llvm::Instruction>(_pVal)->clone());

      // while(!SearchStack.empty()) {
      //   Value* _v = SearchStack.top();
      //   Instruction* _inst = dyn_cast<llvm::Instruction>(_v);
      //   SearchStack.pop();
      //   // int OpNum = (_inst)->getNumOperands();
      //   for (auto operand = _inst->operands().begin(); operand != _inst->operands().end() ; ++operand) {
      //     Value* _op = operand->get();
      //     Instruction* _opInst = dyn_cast<llvm::Instruction>(_op);
      //     SearchStack.push(_op);
      //     auto* _new = _opInst->clone();
      //     Inst2Insert.push_back(_new);
      //   }
      // }
      // for(int i = 0 ; i < Inst2Insert.size() ; i++) {
      //   Inst2Insert[i]->insertBefore(InsertionPoint);
      // }
      Instruction* ir_ptr = Inst2Insert[0];
      ir_ptr->insertBefore(InsertionPoint);
      // Ended
      // ********************************** //


      // Get prefetch value from kernel launch instruction
      // Clone the "load prefetch value" instruction
      Value* _PrefetchVal;
      _PrefetchVal = cast<InvokeInst>(inst)->getArgOperand(prefetchOprandIndex);
      auto *LoadInst = dyn_cast<llvm::Instruction>(_PrefetchVal);
      if(nullptr != LoadInst) {
        errs() << "\t Operand Numbers : " << LoadInst->getNumOperands() << "\n";
      }
      auto *NewInst = LoadInst->clone();


      // %9 = alloca float*, align 8
      // %16 = bitcast float** %9 to i8**
      // %20 = load i8*, i8** %16, align 8, !tbaa !7
      // %21 = call i32 @cudaMemPrefetchAsync(i8* %20, i64 4096, i32 0, %struct.CUstream_st* null)
      IntegerType* int_type32 = IntegerType::get(context, 32);
      IntegerType* int_type64 = IntegerType::get(context, 64);
      StructType* CUstream_struct = module->getTypeByName("struct.CUstream_st");

      if(CUstream_struct)
        errs() << "\t CUstream struct : " << CUstream_struct->getStructName().str() << "\n";

      ConstantInt* device_id = ConstantInt::get(int_type32, 0, false);
      ConstantInt* alloca_size = ConstantInt::get(int_type64, PrefetchSize, false);
      ConstantPointerNull* CU_stream_null =  ConstantPointerNull::get(PointerType::get(CUstream_struct, 0));
      // Prefetch value
      Value* PrefetchVal = dyn_cast<Value>(NewInst);
      // Insert Bitcast instruction
      // Value* ir_ptr = builder.CreateBitCast(PrefetchVal, Type::getInt8PtrTy(context));
      // ir_ptr = builder.CreateBitCast(PrefetchVal, Type::getInt8PtrTy(context));
      NewInst->insertBefore(dyn_cast<llvm::Instruction>(ir_ptr));
      Value* prefetch_args[] = { ir_ptr, alloca_size, device_id, CU_stream_null};

      // Insert CudaMemPrefetchAsync instruction
      CallInst *PI = builder.CreateCall(cuda_prefetch_func, prefetch_args);
      errs() << "\t Done Inserting cuda prefetch instruction \n";

      // 0 for GPU, 1 for CPU
      int _DeviceNum = DeviceNum == 0 ? 0 : -1;
      ConstantInt* SetSize = ConstantInt::get(int_type64, PrefetchSize, false);
      ConstantInt* AdviseType = ConstantInt::get(int_type32, AdviseOption, false);
      ConstantInt* SetDeviceNum = ConstantInt::get(int_type32, _DeviceNum, false);
      Value* advice_args[] = { ir_ptr, SetSize, AdviseType, SetDeviceNum};
      // Insert CudaMemAdvise instruction
      CallInst *AI = builder.CreateCall(cuda_advise_func, advice_args);
      errs() << "\t Done Inserting cuda mem advsise instruction. \n";
      
    }

    void Init(Function *func) {
      Module* module = func->getParent();
      LLVMContext& context = func->getContext();
      // CudaMemPrefetch Function Declaration
      std::vector<Type*> PrefetchFuncTy_args;
      StructType* CUstream_struct = module->getTypeByName("struct.CUstream_st");
      PrefetchFuncTy_args.push_back(PointerType::getInt8PtrTy(context, 0));
      PrefetchFuncTy_args.push_back(IntegerType::getInt64Ty(context));
      PrefetchFuncTy_args.push_back(IntegerType::getInt32Ty(context));
      PrefetchFuncTy_args.push_back(PointerType::get(CUstream_struct, 0));
      
      FunctionType *PrefetchFT = FunctionType::get(IntegerType::get(context, 32), PrefetchFuncTy_args, false);
      // StructType* CUstream_struct = module->getTypeByName("struct.CUstream_st");
      Function *cudaPrefetchDeclaration = Function::Create(PrefetchFT, Function::ExternalLinkage, "cudaMemPrefetchAsync", module);
      cudaPrefetchDeclaration->setDSOLocal(true);
      errs() << "\t Insert cuda Prefetch Declaration! " << "\n";

      // cudaMemAdvise Function Declaration
      std::vector<Type*> AdviseFuncTy_args;
      AdviseFuncTy_args.push_back(PointerType::getInt8PtrTy(context, 0));
      AdviseFuncTy_args.push_back(IntegerType::getInt64Ty(context));
      AdviseFuncTy_args.push_back(IntegerType::getInt32Ty(context));
      AdviseFuncTy_args.push_back(IntegerType::getInt32Ty(context));

      FunctionType *AdviseFT = FunctionType::get(IntegerType::get(context, 32), AdviseFuncTy_args, false);
      Function *cudaMemAdviseDelaration = Function::Create(AdviseFT, Function::ExternalLinkage, "cudaMemAdvise", module);
      cudaMemAdviseDelaration->setDSOLocal(true);
      errs() << "\t Insert cuda Mem Advise! " << "\n";
    }

    virtual bool runOnFunction(Function &F) override {
      LLVMContext& context = F.getContext();
      Module *module = F.getParent();
      bbFromBegin = 0;

      if(!isInit) {
        Init(&F);
        isInit = true;
      }

      for (BasicBlock &BB : F) {
        for (Instruction &inst : BB) {
          // if (dyn_cast<CallInst>(&inst) || dyn_cast<InvokeInst>(&inst)) {
          if(inst.getOpcode() == Instruction::Call || inst.getOpcode() == Instruction::Invoke) { 
            if (isa<InvokeInst>(&inst)) {
              auto call_inst = dyn_cast<InvokeInst>(&(inst));
              Function* func = call_inst->getCalledFunction();
              if(func) {
                StringRef fname = func->getName();
                if(fname == kernelName) {
                // size_t found = fname.find(GaussianKernelName);
                // if(found != string::npos){
                //   errs() << "\t Found Gaussian Kernel Name. - " << fname << "\n";
                  // Entry function is "main" function
                  // if(AdviseOption)
                  // insertCudaAdvise(&F, &inst);
                  // insertPrefetchBB(&F, &inst);
                }
              }
            }
          }
        }
        bbFromBegin += 1;
      }
      return false;
    }
  }; // end of struct cudaMem
}  // end of anonymous namespace

char cudaMem::ID = 0;
string cudaMem::kernelName = "_Z19call_Bezier_surfaceiiifiiiiiP3XYZS0_Pi";
// string cudaMem::kernelName = "_Z21call_Histogram_kerneliiiiiPjS_i";

string cudaMem::cudaMallocManagedName = "cudaMallocManaged";
string cudaMem::cudaPrefetchName = "cudaMemPrefetchAsync";
string cudaMem::cudaMemAdviseName = "cudaMemAdvise";
string cudaMem::cudaLaunchKernelName = "cudaLaunchKernel";
string cudaMem::GaussianKernelName = "call_gaussian_kernel";
string cudaMem::SobelKernelName = "call_sobel_kernel";

static RegisterPass<cudaMem> X("cudamem", "Cuda Mem Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);

static RegisterStandardPasses Y(
    PassManagerBuilder::EP_EarlyAsPossible,
    [](const PassManagerBuilder &Builder,
       legacy::PassManagerBase &PM) { PM.add(new cudaMem()); });


// void insertCudaAdvise(Function *func, Instruction *inst) {
    //   Module* module = func->getParent();
    //   LLVMContext& context = func->getContext();
    //   BasicBlock* kernelBB = inst->getParent();
    //   Function* cuda_advise_func = NULL;

    //   for (auto mod_func = module->begin(); mod_func != module->end(); mod_func++) {
    //     if (mod_func->getName().str().find(cudaMemAdviseName) != string::npos) {
    //         // if(mod_func->isDeclaration())
    //           // errs() << "\t cudaMemPrefetchAsync Delcaration Found !!" << "\n";
    //           errs() << "\t Definition Found !! : " << cudaMemAdviseName << "\n";
    //         cuda_advise_func = &(*mod_func);
    //         break;
    //     }
    //   }

    //   unsigned int cnt = 0;
    //   Instruction *InsertionPoint;
    //   for(auto bb = func->begin() ; bb != func->end() ; bb++) {
    //     if(cnt >= (bbFromBegin - PrefetchDistance)) {
    //     // if(cnt >= 30){
    //       InsertionPoint = &(*bb->begin());
    //       break;
    //     }
    //     cnt++;
    //   }

    //   IRBuilder <> builder(InsertionPoint);
    //   // IRBuilder <> builder(inst);
    //   Value* _PrefetchVal;
    //   _PrefetchVal = cast<InvokeInst>(inst)->getArgOperand(prefetchOprandIndex);
    //   auto *LoadInst = dyn_cast<llvm::Instruction>(_PrefetchVal);
    //   if(nullptr != LoadInst) {
    //     errs() << "\t Operand Numbers : " << LoadInst->getNumOperands() << "\n";
    //   }
    //   auto *NewInst = LoadInst->clone();
    //   IntegerType* int_type32 = IntegerType::get(context, 32);
    //   IntegerType* int_type64 = IntegerType::get(context, 64);
    //   ConstantInt* SetSize = ConstantInt::get(int_type64, PrefetchSize, false);
    //   ConstantInt* AdviseType = ConstantInt::get(int_type32, AdviseOption, false);
    //   ConstantInt* DeviceNum = ConstantInt::get(int_type32, 0, false);
    //   Value* PrefetchVal = dyn_cast<Value>(NewInst);
    //   Value* ir_ptr = builder.CreateBitCast(PrefetchVal, Type::getInt8PtrTy(context));
    //   NewInst->insertBefore(dyn_cast<llvm::Instruction>(ir_ptr));
    //   Value* args[] = { ir_ptr, SetSize, AdviseType, DeviceNum};

    //   // Insert CudaMemAdvise instruction
    //   CallInst *MI = builder.CreateCall(cuda_advise_func, args);
    //   errs() << "\t Done Inserting cuda mem advsise instruction. \n";
    // }

  