nim c -d:release \
 --define:"openmp" \
 --define:"blas=mkl_intel_lp64" \
 --define:"lapack=mkl_intel_lp64" \
 --clibdir:"/opt/intel/mkl/lib/intel64" \
 --passL:"/opt/intel/mkl/lib/intel64/libmkl_intel_lp64.a" \
 --passL:"-lmkl_core" \
 --passL:"-lmkl_gnu_thread" \
 --passL:"-lgomp" \
 --dynlibOverride:"mkl_intel_lp64" \
 mnist.nim