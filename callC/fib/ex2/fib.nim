proc fib_nim(n: int): int {. exportc, dynlib .} = 
  if n<2:
    return n 
  else:
    return fib_nim(n-1) + fib_nim(n-2)