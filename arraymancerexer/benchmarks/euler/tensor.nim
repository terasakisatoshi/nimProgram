import math, times, strformat
import arraymancer

proc getTime(): float =
  when not defined(openmp):
    cpuTime() # This is the most accurate
  else:
    epochTime() # cpuTime count the sum of time on each CPU when multithreading.

const
  dz = 0.1
  z = 1000
  spaceSteps = int(z / dz)
  timeSteps = 100_000
  totalTime = 1_000_000
  dt = totalTime / timeSteps
  alpha = 2e-4
  startingTemp = 30.0
  oscillations = 20.0
  a_dz2 = alpha / dz^2


proc f(T: Tensor[float]): Tensor[float] =
  a_dz2 * (T[_, 0..^3] - 2.0 * T[_, 1..^2] + T[_, 2..^1])

proc eulerSolve(Ts: var Tensor[float]) =
  for t in 0 ..< timeSteps-1:
    Ts[t+1, 1..^2] = Ts[t, 1..^2] + dt * f(Ts[t, _])
    Ts[t+1, ^1] = Ts[t+1, ^2]

proc main() =
  var Ts = newTensorWith[float]([timeSteps, spaceSteps], startingTemp)


  for j in 0 ..< timeSteps:
    Ts[j, 0] = startingTemp - oscillations * sin(2.0 * PI * j.float / timeSteps)

  Ts.eulerSolve()
  echo Ts[45_000, 10]
  echo Ts[45_000, 100]
  echo Ts[45_000, 500]


let start = getTime()
main()
let stop = getTime()

let elapsed = stop - start
echo &"Arraymancer Euler solve - time taken: {elapsed} seconds"