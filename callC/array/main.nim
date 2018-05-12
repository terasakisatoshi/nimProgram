{.compile: "arr.c".}

proc get_head_element[size: static[int]](a: array[size, cint]): cint {.importc.}
proc fill_ones[size: static[int]](a: array[size, cint],length : cint) {.importc.}
proc minus_one[size: static[int]](a: array[size, cint],length : cint): array[size, cint] {.importc.}

var arr1: array[4, cint]
arr1 = [10'i32, 9'i32, 8'i32, 7'i32]
echo get_head_element(arr1)

var arr2: array[3, cint]
arr2 = [-1'i32, -2'i32, -3'i32]
echo get_head_element(arr2)

#fill_ones(arr2, cast[cint](arr2.len))
#echo arr2

#echo minus_one(arr2, cast[cint](arr2.len))
#echo arr2