#iterator example

#This code below does not work.
#[ 
proc countupNumber(a,b:int) : int =
  var res=a
  while res <= b:
    return res
    inc(res)
 ]#
#[
The problem is that the procedure should not only return,
but return and continue after an iteration has finished.
This return and continue is called a yield statement.
Now the only thing left to do is to replace the proc
keyword by iterator and here it is - our first iterator:
]#

iterator countupNumber(a,b:int) : int = 
  var res = a
  while res <= b:
    yield res
    inc(res)

for i in countupNumber(1,5):
  echo i
