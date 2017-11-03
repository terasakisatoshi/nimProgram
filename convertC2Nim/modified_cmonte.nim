import random
randomize()

proc UniformRandom01*(): float =
  return random(max=1.0)

proc main*(): int =
  var N: int = 100000000
  var counter: int = 0
  var i: int = 0
  while i < N:
    var x: float = UniformRandom01()
    var y: float = UniformRandom01()
    if x * x + y * y < 1.0:
      inc(counter, 1)
    inc(i)
  echo "approx pi is \x0A", 4.0 * counter.float / N.float

when isMainModule:
  discard main()
