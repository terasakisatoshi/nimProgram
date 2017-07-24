#[ 
The built-in $ stringify operator turn any basic type into
a string, which you can then print to the console using the echo
proc. However, advanced types, and your own custom types, won't work
  with the $ operator until you define it for them. Sometimes you just
  want to debug the current value of a complex type without having
  to write its $ operator. You can use then the repr proc
  which works with any type and even complex data graphs with
  cycles. The following example shows that even for basic types there is a 
  difference between the $ and repr outputs:
 ]#

var 
  myBool=true
  myCharacter='n'
  myString="nim"
  myInteger=42
  myFloat=3.14

echo myBool, ":" , repr(myBool)
echo myCharacter, ":", repr(myCharacter)
echo myString, ":", repr(myString)
echo myInteger, ":",repr(myInteger)
echo myFloat, ":", repr(myFloat)
