#[ 
A procedure proc that returns a value has an implicit result variable 
declared that represents the retun value.
]#

proc sumTillNegative(x: varargs[int]): int =
  for i in x:
    if i < 0 :
      #[ A return statement with noexpression is a shorthand for return result.
The result value is always returned automatically at the end of a procedure if 
there is no return statement at the exit. ]#
      return 
    result = result + i

echo sumTillNegative()
echo sumTillNegative(3,4,5,6)
echo sumTillNegative(3,4,-1,9)