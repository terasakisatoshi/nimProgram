#array
#[ 
An array is a simple fixed length container.
Each element in an array has the same type.
The array's index type can be any ordinal type.
 ]#

type
  IntArray = array[0..5, int] #an array that is indexed with 0..5
var
  x: IntArray

x=[11,9,7,5,3,1]
for i in low(x)..high(x):
  echo x[i]#i-th element of x
