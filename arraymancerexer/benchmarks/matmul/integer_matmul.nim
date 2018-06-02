import os, strutils, random
import arraymancer

{.passC: "-march=native" .}
# {.passl: "-fopenmp".}
# {.passc: "-fopenmp".}

proc main(n: int) =
  let even_n = n div 2 * 2

  let a, b = randomTensor(n,n, 100_000_000.int - 1) # Nim ints are int64 on x86_64
  let c = a*b
  echo $c[even_n div 2, even_n div 2]

when isMainModule:
  if paramCount()>0:
    main(parseInt(paramStr(1)))
  else:
    main(100)