{.compile: "arr.c".}

proc get_head_element(a: ptr UncheckedArray[cint]): cint {.importc.}
proc fill_ones(a: ptr UncheckedArray[cint],length : cint) {.importc.}
proc minus_one(a: ptr UncheckedArray[cint],length : cint): ptr UncheckedArray[cint] {.importc.}

var arr1 = cast[ptr UncheckedArray[cint]](alloc0(UncheckedArray[cint].sizeof * 4))
var arr2 = cast[ptr UncheckedArray[cint]](alloc0(UncheckedArray[cint].sizeof * 3))

var nimArr1 : array[4, cint] = [10'i32, 9'i32, 8'i32, 7'i32]
arr1 = cast[ptr UncheckedArray[cint]](addr nimArr1)

var nimArr2 : array[3, cint] = [-1'i32, -2'i32, -3'i32]
arr2 = cast[ptr UncheckedArray[cint]](addr nimArr2)


echo get_head_element(arr1)
echo get_head_element(arr2)

fill_ones(arr1, 4)
echo arr1[0], arr1[1], arr1[2], arr1[3]

var ret :auto = minus_one(arr2, 3) 
echo ret[0], ret[1], ret[2]