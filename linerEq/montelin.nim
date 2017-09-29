import linalg
import random 

randomize()

proc getLessThanOne(x:float64): float64=
  if x < 1.0:
    return 1.0
  else:
    return 0.0

makeUniversal(getLessThanOne)

proc main(): void =
  const size=100_000_000
  var 
    x: Vector64[size] = randomVector(size, max=1.0)
    y: Vector64[size] = randomVector(size, max=1.0)
  var counter=sum(getLessThanOne((x|*|x)+(y|*|y)))
  echo 4.0*counter.float64/size.float64

when isMainModule:
  main()