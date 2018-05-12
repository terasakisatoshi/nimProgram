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

var intArr = [1, 2, 3, 4, 5]
reverse(intArr) # reverse[int](intArr) でも良い
echo intArr # [5, 4, 3, 2, 1]

var msg = "miN morf olleH"
reverse(msg) # reverse[char](msg) でも良い
echo msg # Hello from Nim