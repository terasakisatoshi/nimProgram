proc swap[T](a, b: var T) =
  var tmp = a
  a = b
  b = tmp

proc reverse[T](arr: var openArray[T]) =
  var x = 0
  var y = arr.high
  while x < y:
    swap(arr[x], arr[y])
    dec(y)
    inc(x)

var intArr = [1,2,3,4,5]
reverse(intArr)
echo intArr

var msg = "miN morf olleH"
reverse(msg)
echo msg

type
  # Person = tuple[name: string, age: int]
  Person = tuple
    name: string
    age: int

var 
  taro: Person = (name: "Taro", age: 15)
  jiro: Person = (name: "Jiro", age: 12)
  hanako: Person = (name: "Hanako", age: 10)

var persons = [taro, jiro, hanako]
echo persons
reverse(persons)
echo persons