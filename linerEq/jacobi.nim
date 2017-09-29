type
  Matrix[W,H: static[int];T] = array[1..W,array[1..H,T]]

type
  Vector[L:static[int];T] = array[1..L,T]

#bad writing I think ... but can't create alternative way.
proc jacobi(mat:Matrix,vec:Vector,xs:Vector):Vector =
  var xsNew :Vector
  var xsOld = xs
  var finish = true
  while true:
    xsNew = [0.0,0.0,0.0,0.0]
    finish=true
    for i in 1..high(mat):
      xsNew[i]=vec[i]
      for j in 1..high(mat[0]):
        if j!= i:
          xsNew[i]-=mat[i][j] * xsOld[j]
      xsNew[i]/=mat[i][i]
      if abs(xsNew[i]-xsOld[i]) > 10e-7:
        finish=false

    xsOld=xsNew
    if finish:
      break
  return xsOld


const N = 4
let mat : Matrix[N,N,float64] 
            = [[9.0,2.0,1.0,1.0],
               [2.0,8.0,-2.0,1.0],
               [-1.0,-2.0,7.0,-2.0],
               [1.0,-1.0,-2.0,6.0]]

let vec : Vector[N,float64] = [20.0,16.0,8.0,17.0]
var init : Vector[N,float64] = [0.0,0.0,0.0,0.0]

var solution = jacobi(mat,vec,init)
echo repr(solution)


