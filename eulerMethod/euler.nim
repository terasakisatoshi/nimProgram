import times

proc main()=
  const N :int = 1000000
  const h: float64 = 0.00000004
  var y:array[N,float64]
  var s = cpuTime()
  for n in 0..<N-1:
    y[n+1]=y[n]-h*y[n]
  var e = cpuTime()
  echo "elapsed ", e-s, "[sec]"
if isMainModule:
  main()