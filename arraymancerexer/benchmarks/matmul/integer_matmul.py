import numpy as np

def main(n):
    a = np.random.randint(100000000, size=(n,n)) # Default type is np.int which should also be int64
    b = a
    c = np.dot(a, b)
    print(c[n // 2][n // 2])


if __name__=='__main__':
    import sys

    if len(sys.argv) > 1:
        main(int(sys.argv[1]))
    else:
        main(100)