from algorithm import sort


proc median*(x: openArray[float]): float {. exportc, dynlib .} = 
  ## Computes the median of the elements in `x`. 
  ## If `x` is empty, NaN is returned.
  if x.len == 0:
    return NAN

  var sx = @x # convert to a sequence since sort() won't take an openArray
  sx.sort(system.cmp[float])

  if sx.len mod 2 == 0:
    var n1 = sx[(sx.len - 1) div 2]
    var n2 = sx[sx.len div 2]
    result = (n1 + n2) / 2.0
  else:
    result = sx[(sx.len - 1) div 2]


proc add_two_vector*(xs:openArray[float], ys:openArray[float]):float {.exportc,dynlib.}=
  var s:float=0.0
  for i,x in xs:
    echo i,x,ys[i]
    s += x+ys[i]
  echo s
  return s
