#[ 
Parameters are constant in the procedure body.
By default, their value cannot be changed
because this allows the compiler to implement parameter passing int the
most efficient way.
If a mutable variabe is needed inside the procedure, it has to be
declared with var in the procedure body.
Shadowing the parameter name is possible, and actually an idiom.
 ]#

#[ 
If the procedure needs to modify the argument for the caller,
a var parameter can be used
 ]#
proc divmod(a,b:int; res, remainder: var int): int = 
  res = a div b
  remainder = a mod b
  return 999

var
  x,y:int

var ret=divmod(8,5,x,y)
echo x
echo y
echo ret
