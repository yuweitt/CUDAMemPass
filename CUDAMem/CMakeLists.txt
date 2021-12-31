
if(WIN32 OR CYGWIN)
  set(LLVM_LINK_COMPONENTS Core Support)
endif()

add_llvm_library( CUDAMemPass MODULE
  cuda_mem.cpp

  PLUGIN_TOOL
  opt
  )
