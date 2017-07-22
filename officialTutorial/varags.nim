
#[ 
A vararg parameter is like an oppenarry parameter.
However it means to implement passing a variable number of
arguments to aprocedure.The compiler converts the list of arguments to an array automatically ]#
proc myWriteln(f:File, a:varargs[string]) =
  for s in items(a):
    write(f,s)
  write(f,"\n")

mywriteln(stdout,"abc","def","xyz")
#is transformed by the compiler to:
mywriteln(stdout,["abc","def","xyz"])