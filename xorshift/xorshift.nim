#Reference:https://nim-by-example.github.io/for_iterators/
import math 
proc xorshift32(seed = uint32(2463534242)): iterator(): uint32 =
  return iterator(): uint32 =
    var y = seed
    while true:
      y = y xor (y shl 13)
      y = y xor (y shr 17)
      y = y xor (y shl 5)
      yield y

proc uniform(rand=xorshift32(), b=0.0,e=1.0): iterator():float64=
  const maxUint32 = math.pow(2.0,32.0)-1
  return iterator():float64=
    while true:
      var value=b+float64(rand())/maxUint32/(e-b)
      yield value
      
when isMainModule:
  var N=100_000_000
  var counter=0
  var uniform01=uniform()
  var x,y :float64
  for i in 1..N:
    x=uniform01()
    y=uniform01()
    if x*x+y*y<1.0:
      counter+=1
  echo "Pi=", 4.0*float64(counter)/float64(N)