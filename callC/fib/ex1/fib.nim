proc fib(a: cint): cint {.exportc.} =
  if a <= 2:
    result = 1
  else:
    result = fib(a - 1) + fib(a - 2)

proc get_seq(n: cint): ptr seq[cint] {.exportc.} =
  var v = newSeq[cint](n)
  for i, _ in v:
    var ci:cint = cast[cint](i)
    v[i]=ci
  #echo v
  result = cast[ptr seq[cint]](addr v[0])

proc get_arr(): ptr array[3, cint] {.exportc.} =
  var v : array[3,cint]
  for i, _ in v:
    var ci:cint = cast[cint](i)
    v[i]= -ci
  #echo v
  result = cast[ptr array[3, cint]](addr v[0])