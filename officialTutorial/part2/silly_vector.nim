#The example is silly, since a vector is better modelled by a tuple which already provides v[] access.

type 
  Vector* =object
    x,y,z:float


proc `[]=`*(v:var Vector, i:int, value:float)=
  #setter
  case i
  of 0:v.x=value
  of 1:v.y=value
  of 2:v.z=value
  else:assert(false)

proc `[]`* (v:Vector,i:int):float =
  #getter 
  case i
  of 0:result=v.x
  of 1:result=v.y
  of 2:result=v.z
  else:assert(false)

var v : Vector

v[0]=9
v[1]=8
v[2]=7

echo v[0],",",v[1],",",v[2] 