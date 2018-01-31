from math import gcd, sqrt
import times

proc calc_pi_by_gcd(N:int):float64=
  var s=0
  for a in 1..N:
    for b in 1..N:
      if gcd(a,b)==1:
        s+=1
  var pi = sqrt(6*N*N/s)
  return pi
if isMainModule:
  var startTime=cpuTime()
  echo calc_pi_by_gcd(1000)
  var endTime=cpuTime()
  echo endTime-startTime