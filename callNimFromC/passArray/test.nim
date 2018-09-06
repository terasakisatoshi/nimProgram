proc fillOnes(data: var array[100,cint], length: var cint): cint{.exportc.}=
  for i in 0..<10:
    data[i]=cast[cint](i)
  length=cast[cint](data.len)
  return 0