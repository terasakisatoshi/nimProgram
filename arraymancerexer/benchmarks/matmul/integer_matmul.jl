function main(n)
  n = round(Int, n / 2 * 2)
  a = rand(0:100_000_000, n, n)
  b = a
  c = a * b
  v = round(Int, n/2) + 1
  println(c[v, v])
end