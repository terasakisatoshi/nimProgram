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
    logger.info("load library")
    test_lib = cdll.LoadLibrary("libdo_something.dylib")
    np_array = np.array([1, 2, 3, 4, 5, 6, 7, 8]).astype(np.float64)
    test_lib.do_something.argtypes = [np.ctypeslib.ndpointer(flags="C"), c_int,
                                      np.ctypeslib.ndpointer(flags="C"), c_int]
    test_lib.do_something.restype = c_double
    res = test_lib.do_something(np_array, int(8), np_array, int(8))
    logger.info(res)


if __name__ == '__main__':
    main()
