#proc
proc sayHi(name: string) =
  echo "Hello", name
#example
sayHi("World")
sayHi "World"
"World".sayHi

#generic proc
proc min[T](x, y: T): T=
  if x < y: x else: y
#example
echo min(2,3)
echo min[int](2,3)
echo min("foo", "bar")
echo min[string]("foo","bar")

#iterator 
iterator reverseItems(x: string): char =
  for i in countdown(x.high, x.low):
    yield x[i]
#example
for c in "foo".reverseItems:
  echo c

for c in reverseItems("foo"):
  echo c 


 c

# closure iterators 
import math 

proc powers(m :int): auto = 
  return iterator: int = 
    for n in 0..int.high:
      yield n^m

# As you can see closure iterators keep their state. You can call them again and get the next value, or use them inside of a for-loop to get out many values.
var 
  squares = powers(2)
  cubes = powers(3)

for i in 1..4:
  echo "Square: ", squares()

for i in 1..4:
  echo "Cube: ", cubes()

echo "Square: ", squares()
echo "Cube: ", cubes()