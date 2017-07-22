# Nim provides the ablity to overloaded procedure similiar to C++:

proc toString(x: int): int = 
  return 12345
proc toString(x:bool): string =
  if x: result = "true"
  else:result = "false"

echo toString(13)
echo toString(true)


#[ 
(Note that toString is usually the $ operator in Nim.)
The compiler chooses the most appropriate proc for the
toString calls.
How this overloading resolution algorithm works exactly is not 
discussed here( it will be specified in the manual soon).
However, it does not lead to nasty surprises and is based on a quite 
simple unification algorithm.
Ambiguous calls are reported as erros.
 ]#