type
  #define M by N matrix over type T
  Matrix[T; M, N: static[int]] =
    array[1..M, array[1..N, T]]

var A: Matrix[int, 3, 2] = [[1, 0],
                            [0, 1],
                            [1, 0]]

var B: Matrix[int, 2, 3] = [[1, 0, 1],
                            [0, 1, 0]]

proc `*`[T, I, K, J](a: Matrix[T, I, K], b: Matrix[T, K, J]): Matrix[T, I, J] = 
  var c: Matrix[T, I, J]
  for i in 1..I:
    for j in 1..J:
      for k in 1..K:
        c[i][j] += a[i][k] * b[k][j]
  result = c

var C: Matrix[int, 3, 3]

C = A * B

echo C