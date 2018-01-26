proc main()=
  const N :int64 = 100000000
  const h: float64 = 0.00000004
  var y:array[N,float64]
  y[0]=1.0
  for n in 0..<N-1:
    y[n+1]=y[n]-h*y[n]

if isMainModule:
  main()