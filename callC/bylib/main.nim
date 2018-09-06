proc fill_nimarr_by_one(arr: ptr cint,size: cint) {.dynlib: "libshared.so", importc: "fill_one".}
proc get_average(arr:ptr cint,size: cint):cfloat {.dynlib: "libshared.so", importc: "get_average".} 

var arr:seq[cint] = @[1'i32,2'i32,3'i32]
fill_nimarr_by_one(addr arr[0],3)
echo arr
echo get_average(addr arr[0],3)