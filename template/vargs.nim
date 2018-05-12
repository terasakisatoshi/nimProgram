proc function(x: int): int = 
  2*x

proc vargFunc(xs: varargs[int, function])=
  for x in xs:
    echo x

vargFunc(1,2,3,4)
# is transformed by the compiler to:
#vargFunc([f(1),f(2),f(3),f(4)])