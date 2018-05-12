proc getReversedSeq[T](arr: openarray[T]): seq[T] =
  var length = arr.len 
  result = newSeq[T](length)
  for i, x in arr:
     result[length-i-1] = x

when isMainModule:
  const arr = [1,2,3]
  echo getReversedSeq(arr)
  echo getReversedSeq("Hi")