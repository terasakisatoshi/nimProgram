#[
Reference:
https://forum.nim-lang.org/t/1188
]#

template ptrMath(body: untyped) =
  template `+`[T](p: ptr T, off: int): ptr T =
    cast[ptr type(p[])](cast[ByteAddress](p) +% off * sizeof(p[]))
  
  template `+=`[T](p: ptr T, off: int) =
    p = p + off
  
  template `-`[T](p: ptr T, off: int): ptr T =
    cast[ptr type(p[])](cast[ByteAddress](p) -% off * sizeof(p[]))
  
  template `-=`[T](p: ptr T, off: int) =
    p = p - off
  
  template `[]`[T](p: ptr T, off: int): T =
    (p + off)[]
  
  template `[]=`[T](p: ptr T, off: int, val: T) =
    (p + off)[] = val
  body


proc test_arr(): pointer {.exportc.} =
  ptrMath:
    var p = cast[ptr cfloat](alloc0 sizeof(array[3, cfloat]))
    var a: array[3, cfloat]
    for i in a.low..a.high:
      a[i] += 1'f32

    p[0] = a[0]-4'f32
    p[1] = a[1]-2'f32
    p[2] = a[2]-3'f32
  return p

#[
proc test_arr(): pointer {.exportc.} =
  var p = cast[ptr cfloat](alloc0 sizeof(array[3, cfloat]))

  cast[ptr cfloat](cast[ByteAddress](p) +% 0 * sizeof(p[]))[] = -1'f32
  cast[ptr cfloat](cast[ByteAddress](p) +% 1 * sizeof(p[]))[] = -2'f32
  cast[ptr cfloat](cast[ByteAddress](p) +% 2 * sizeof(p[]))[] = -3'f32
  return p
]#
