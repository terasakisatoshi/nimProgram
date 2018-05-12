# http://rnduja.github.io/2015/10/21/scientific-nim/
# https://nim-lang.org/docs/backends.html
{.compile: "arr.c".}

proc get_head_element(a: ptr array[3, cint]): cint {.importc.}

proc malloc(size: uint): pointer {.header: "<stdlib.h>", importc: "malloc".}
proc free(p: pointer):void {.header: "<stdlib.h>", importc: "free".}

var allocated = malloc(3)
var cArray = cast[ptr array[3, cint]](allocated)

for i in 0..<3:
  cArray[i] = cast[cint](-i)

echo cArray[0]
echo cArray[1]
echo cArray[2]

echo get_head_element(cArray)

free(allocated)