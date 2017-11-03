## http://www.sat.t.u-tokyo.ac.jp/~omi/random_variables_generation.html#Uniform

proc UniformRandom01*(): cdouble =
  return (cast[cdouble](rand()) + 1.0) div (cast[cdouble](RAND_MAX) + 2.0)

proc main*(): cint =
  srand(time(nil))
  var N: cint = 100000000
  var counter: cint = 0
  var i: cint = 0
  while i < N:
    var x: cdouble = UniformRandom01()
    var y: cdouble = UniformRandom01()
    if x * x + y * y < 1.0:
      inc(counter, 1)
    inc(i)
  printf("approx pi is %f\x0A", 4 * counter div cast[cdouble](N))
