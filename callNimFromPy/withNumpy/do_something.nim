proc echo_N_times*(N:int32):void {.exportc, dynlib.} =
  for i in 0..<N:
    echo i 

proc echo_array*(xs: openArray[float]):void {.exportc, dynlib.} =
  for x in xs:
    echo x 

proc do_something*(xs:openArray[float], ys:openArray[float]):float {.exportc, dynlib.}=
  var s:float=0.0
  for i in low(xs)..high(xs):
    s += xs[i]+ys[i]
    echo "s = ", s
  s