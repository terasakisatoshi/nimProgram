#[ 
Sequence are similar to arrays but of dynamic length
which may change during runtime(like strings).
Since sequences are resizable they always allocated
on the heap and garbage collected.
 ]#


var 
  x:seq[int] # a reference to a sequence of integers

#the @ turns the array into a sequence allocated on the heap.
x = @[1,2,3,4,5,6]

echo x
echo repr(x)

for value in @[3,4,5]:
  echo value

for i,value in @[7,6,5]:
  echo "index: ", $i, ",value:,", $value