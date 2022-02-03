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
  BasicBlockCount(
    "cnt", cl::desc("Specify Basic Block Count"), cl::value_desc("BB Count")
  );

namespace {
  struct cudaMem : public FunctionPass {
    int num_of_malloc_managed;
    static char ID;
    bool isInit;
    static string kernelName;
    static string cudaMallocManagedName;
    static string cudaPrefetchName;
    static string cudaLaunchKernelName;
    cudaMem() : FunctionPass(ID) {
      isInit = false;
      num_of_malloc_managed = 0;
    }



    // void collectKernels(Module *module) {
    //   // bool kernel_found = false;
    //   // named_meta be a named_metadata iterator
    //   Module::NamedMDListType &MDListNode = module->getNamedMDList();
    //   // it : llvm::iplist<const llvm::NamedMDNode>::iterator
    //   for(auto it = MDListNode.begin() ; it != MDListNode.end() ; it++) {
    //     llvm::NamedMDNode *named_meta = &(*it);
    //     for (auto op = named_meta->op_begin(); op != named_meta->op_end(); op++) {
    //       MDNode* node = (*op);
    //       for(auto sub_op = node->op_begin() ; sub_op != node->op_end() ; sub_op++ ) {
    //       //   // sub_op->op_begin() {return MDOperand} llvm::MDOperand->get() {retrun Metadata}
    //         Metadata* meta = sub_op->get();
    //         if (!meta) continue;
    //         MDString* meta_str = dyn_cast<MDString>(meta);
    //         if(meta_str && meta_str->getString().str() == "kernel") {
    //           errs() << "\t kernel found!!" << "\n";
    //         }
    //           // errs() << "\t Metadata Name : " << meta_str->getString().str() << "\n";
    //       }
    //     }
    //   }
    // }

    // void countManagedMalloc(Module *module) {
    //   for (auto func = module->begin(); func != module->end(); func++) {
    //     // inherited from llvm::Value
    //     if (func->getName().str().find("mem_acc_stat_table_alloc") != string::npos) 
    //       continue;

    //     if (func->getName().str().find("channel_host_init") == string::npos
    //                   && func->getName().str().find(cudaMallocManagedName) == string::npos) {
    //       for (auto inst = inst_begin(&*func); inst != inst_end(&*func); inst++) {
    //           if (auto call_inst = dyn_cast<CallInst>(&(*inst))) {
    //               auto called_func = call_inst->getCalledValue();
    //               if (called_func->getName().str().find(cudaMallocManagedName) != string::npos) {
    //                   errs() << __func__ << ": " << called_func->getName() <<"\n";
    //                   num_of_malloc_managed++;
    //               }
    //           }
    //           else if (auto invoke_inst = dyn_cast<InvokeInst>(&*inst)) {
    //               auto called_value = invoke_inst->getCalledOperand();
    //               if (called_value->getName().str().find(cudaMallocManagedName) != string::npos) {
    //                   errs() << "Invoke --- Called Value --- " << called_value->getName() << "\n";
    //                   called_value->dump();
    //                   num_of_malloc_managed++;
    //               }
    //           }
    //       }  
    //     }
    //   }
    // }

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

      errs() << "\t Basic Block Count : " << BasicBlockCount << "\n";

      // Determine which basic block to insert prefetch instruction
      int cnt = 0;
      Instruction *InsertionPoint;
      for(auto bb = func->begin() ; bb != func->end() ; bb++) {
        if(cnt >= BasicBlockCount) {
          InsertionPoint = &(*bb->begin());
          break;
        }
        cnt++;
      }
      IRBuilder <> builder(InsertionPoint);

      // errs() << "\t Found cudaLaunchKernel : " << val << "\n";
      
      // instruction = invoke cuda kernel
      if(nullptr != (inst)) {
        errs() << "\t Instruction Name : " << (inst)->getOpcodeName() << "\n";
        errs() << "\t Operand Numbers : " << (inst)->getNumOperands() << "\n";
      }

      // Get prefetch value from kernel launch instruction
      // Clone the "load prefetch value" instruction
      int prefetchOprandIndex = 9;
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
      ConstantInt* alloca_size = ConstantInt::get(int_type64, 4096, false);
      ConstantPointerNull* CU_stream_null =  ConstantPointerNull::get(PointerType::get(CUstream_struct, 0));
      
      // Prefetch value
      Value* PrefetchVal = dyn_cast<Value>(NewInst);
      
      // Insert Bitcast instruction
      Value* ir_ptr = builder.CreateBitCast(PrefetchVal, Type::getInt8PtrTy(context));
      NewInst->insertBefore(dyn_cast<llvm::Instruction>(ir_ptr));

      Value* args[] = { ir_ptr, alloca_size, device_id, CU_stream_null};

      // Insert CudaMemPrefetchAsync instruction
      CallInst *MI = builder.CreateCall(cuda_prefetch_func, args);
      errs() << "\t Done Inserting cuda prefetch : " << MI->getName().str() << " instruction. \n";
    }

    virtual bool runOnFunction(Function &F) override {
      LLVMContext& context = F.getContext();
      Module *module = F.getParent();
      for (BasicBlock &BB : F) {
        // BasicBlock *cur = BB;
        for (Instruction &inst : BB) {
          // if (dyn_cast<CallInst>(&inst) || dyn_cast<InvokeInst>(&inst)) {
          if(inst.getOpcode() == Instruction::Call || inst.getOpcode() == Instruction::Invoke) { 
            // Instruction* I = &(inst);
            // errs() << "\n callinst => " << inst.getOpcodeName() << "\n";
            if (isa<InvokeInst>(&inst)) {
              auto call_inst = dyn_cast<InvokeInst>(&(inst));
              Function* func = call_inst->getCalledFunction();
              if(func) {
                StringRef fname = func->getName();
                if(fname == kernelName) {
                  // Entry function is "main" function
                  insertPrefetchBB(&F, &inst);
                }
              }
            }
          }
        }
      }
      return false;
    }
  }; // end of struct cudaMem
}  // end of anonymous namespace

char cudaMem::ID = 0;
// string cudaMem::cudaMallocManagedName = "_ZL17cudaMallocManagedIiE9cudaErrorPPT_mj";
string cudaMem::kernelName = "_Z19call_Bezier_surfaceiiifiiiiiP3XYZS0_Pi";
string cudaMem::cudaMallocManagedName = "cudaMallocManaged";
string cudaMem::cudaPrefetchName = "cudaMemPrefetchAsync";
string cudaMem::cudaLaunchKernelName = "cudaLaunchKernel";

static RegisterPass<cudaMem> X("cudamem", "Cuda Mem Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);

static RegisterStandardPasses Y(
    PassManagerBuilder::EP_EarlyAsPossible,
    [](const PassManagerBuilder &Builder,
       legacy::PassManagerBase &PM) { PM.add(new cudaMem()); });
