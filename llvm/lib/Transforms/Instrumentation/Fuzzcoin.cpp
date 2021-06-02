#include "llvm/Pass.h"
#include "llvm/Analysis/MemoryBuiltins.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/Transforms/Instrumentation.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/ModuleUtils.h"

#include <iostream>
#include <utility>

using namespace llvm;

namespace {
    struct Fuzzcoin : public ModulePass {
        static char ID;
        Fuzzcoin() : ModulePass(ID) {}
        bool runOnModule(Module &M);
        bool runOnFunction(Function &F, Module &M);
        bool runOnBasicBlock(BasicBlock &BB, Module &M);
        bool initialize(Module &M);
    };
}

bool Fuzzcoin::runOnModule(Module &M) {
    bool modified = initialize(M);

    for(Module::iterator F = M.begin(), E = M.end(); F != E; ++F) { 
        modified |= runOnFunction(*F, M);
    }

    return modified;
}

bool Fuzzcoin::runOnFunction(Function &F, Module &M) {
    bool modified = false;

    for(Function::iterator BB = F.begin(), E = F.end(); BB != E; ++BB) {
        modified |= runOnBasicBlock(*BB, M);
    }

    return modified;
}

bool Fuzzcoin::runOnBasicBlock(BasicBlock &BB, Module &M) {
    //GlobalVariable *bbCounter = M.getGlobalVariable("bbCounter");
    //assert(bbCounter && "Error: unable to get BasicBlock counter");

    // Load, increment and store the value back
    /*
    Value *OldVal = new LoadInst(bbCounter, "old.bb.count", InsertPos);
    Value *NewVal = BinaryOperator::Create(
              Instruction::Add
            , OldVal
            , ConstantInt::get(Type::getInt64Ty(BB.getContext()), 1)
            , "new.bb.count"
            , InsertPos);
    new StoreInst(NewVal, bbCounter, InsertPos);
    */

    // Insert trace call at the end of each BasicBlock
    TerminatorInst *InsertPos = BB.getTerminator(); 
    Type *VoidTy = Type::getVoidTy(M.getContext());
    FunctionType *FTy = FunctionType::get(VoidTy, VoidTy);
    Constant *myFunc = M.getOrInsertFunction("FuzzTrace", FTy);
    CallInst::Create(myFunc, "", InsertPos);

    return true; // IR modified
}

bool Fuzzcoin::initialize(Module &M) { 
    // register init func to CTORS
    FunctionType* FT = FunctionType::get(Type::getVoidTy(M.getContext()), false);
    Function* F = Function::Create(FT, GlobalValue::InternalLinkage, "InitFuzzcoin", &M);
    assert(F && "Error: unable to get InitFuzzcoin func");
    appendToGlobalCtors(M, F, 0);   

//    Type *VoidTy = Type::getVoidTy(M.getContext());
//    FunctionType *FTy = FunctionType::get(VoidTy, VoidTy);
//    Function *F = M.getOrInsertFunction("InitFuzzcoin", FTy);

    /*
    Type *I64Ty = Type::getInt64Ty(M.getContext());

    //   int64 bbCounter = 0;
    new GlobalVariable(
              M                           // Module
            , I64Ty                       // Type
            , false                       // isConstant
            , GlobalValue::CommonLinkage  // Linkage
            , ConstantInt::get(I64Ty, 0)  // Initializer 
            , "bbCounter");               // Name
    */

    return true; // modified IR
}

char Fuzzcoin::ID = 0;
ModulePass* llvm::createFuzzcoinPass() { return new Fuzzcoin(); }


