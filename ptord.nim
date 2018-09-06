type 
  Point[T] = ref object of RootObj
    x, y: T

proc `$`[T](p: Point[T]): string = 
  result = "(" & $p.x & ", " & $p.y & ")"

var p = Point[int](x: 0, y: 0)
var q = Point[int](x: 0, y: 1)
var r = Point[int](x: 1, y: 0)

echo p
echo p < q
echo q < r

echo p <= q
echo p > q

