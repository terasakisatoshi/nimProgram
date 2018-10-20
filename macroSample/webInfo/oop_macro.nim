type Point = ref object of RootObj 
  x: int 
  y: int

proc `$`(p:Point):string=
  "Point(" & $p.x & ", " & $p.y & ")" 
proc add(p:Point,q:Point):Point=
  Point(x:p.x+q.x,y:p.y+q.y)

let p = Point(x:3,y:5)
let q = Point(x:2,y:4)
echo add(p,q)