iterator reverseItems[T](x: openArray[T]): T =
  for i in countdown(x.high, x.low):
    yield x[i]

for c in reverseItems("foo"):
  echo c

var arr = [0,1,2]
for c in reverseItems(arr):
  echo c

import algorithm 

var msg ="Hello"
reverse(msg)
echo msg