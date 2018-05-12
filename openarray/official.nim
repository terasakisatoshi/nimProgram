#[
https://github.com/nim-lang/Nim/blob/master/lib/pure/algorithm.nim#L34
]#

proc fillValue[T](a: var openArray[T], value: T) = 
  var x = 0
  while x <= a.high:
    a[x] = value
    inc x

proc main2()=
  var intArr : array[10,int]
  echo intArr
  fillValue(intArr, -1)
  echo intArr

  var charArr : array[10,char]
  echo charArr
  fillValue(charArr,'A')
  echo charArr

  type
    Human = object
      name: string
      age: int

  var human = Human(name:"Taro",age:15)
  var japanesePeople: array[10, Human]
  fillValue(japanesePeople, human)
  echo japanesePeople

proc swap(a, b: var int) = 
  var tmp = a
  a = b
  b = tmp

proc reverseIntArray(a: var openArray[int]) =
  var x = 0
  var y = a.high
  while x < y:
    swap(a[x], a[y])
    dec(y)
    inc(x)

proc reverseAnything[T](a: var openArray[T]) =
  var x = 0
  var y = a.high
  while x < y:
    swap(a[x], a[y])
    dec(y)
    inc(x)

proc test() =
  var intArr = [1,2,3,4,5]
  reverseIntArray(intArr)
  echo intArr

  #var msg = "miN morf olleH"
  #reverseIntArray(msg)
  #echo msg

proc generics() =
  var intArr = [1,2,3,4,5]
  reverseAnything(intArr)
  echo intArr

  var msg = "miN morf olleH"
  reverseAnything(msg)
  echo msg

test()
generics()
echo reverse("Hello")