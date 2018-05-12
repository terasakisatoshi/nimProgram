var arr: array[3, cint]
arr = [1'i32, 2'i32, 3'i32]

var nimArr = cast[ptr array[3, cint]](addr arr[0])

echo nimArr[0]
echo nimArr[1]
echo nimArr[2]