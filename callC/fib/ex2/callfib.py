from ctypes import *


def fib_nim(n):
    fib_nim = CDLL("./libfib.dylib")
    return fib_nim.fib_nim(n)

print(fib_nim(40))
