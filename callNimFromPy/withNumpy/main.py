"""
http://akehrer.github.io/posts/connecting-nim-to-python/
https://forum.nim-lang.org/t/2555
"""
import logging
from ctypes import *

import numpy as np

logging.basicConfig()
logger = logging.getLogger()
logger.setLevel(logging.INFO)


def main():
    # Function parameter types
    test_lib = cdll.LoadLibrary("libstats.dylib")
    test_lib.median.argtypes = [POINTER(c_double), c_int]
    # Function return types
    test_lib.median.restype = c_double

    # Calc some numbers
    nums = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
    nums_arr = (c_double * len(nums))()
    for i, v in enumerate(nums):
        nums_arr[i] = c_double(v)
    logger.info("CALL")
    med_res = test_lib.median(nums_arr, c_int(len(nums_arr)))
    logger.info('The median of %s is: %f' % (nums, med_res))

    test_lib.median.argtypes = [np.ctypeslib.ndpointer(flags="C"), c_int]
    # Function return types
    test_lib.median.restype = c_double
    nparr = np.array([1, 2, 3, 4, 5, 6, 7, 8]).astype(np.float64)
    ret = test_lib.median(nparr, c_int(nparr.size))
    logger.info(ret)
    nparr = np.array([1, 2, 3, 4, 5, 6, 7, 8]).astype(np.float64)
    test_lib.add_two_vector.argtypes = [np.ctypeslib.ndpointer(flags="C"), c_int,
                                        np.ctypeslib.ndpointer(flags="C"), c_int]
    test_lib.add_two_vector.restype = c_double
    res = test_lib.add_two_vector(nparr, 8, nparr, 8)
    logger.info(res)
if __name__ == '__main__':
    main()
