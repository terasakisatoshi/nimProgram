
{.passC: "-I.".}
type
  MyStruct {.header: "mystruct.h", importc: "MyStruct".} = object
    x: cint
    y: cint

proc printMyStruct(ms: MyStruct)
  {.importc: "printMyStruct", dynlib:"./mystruct.so".}

var mystr = MyStruct(x: 5.cint,y: -3.cint)

echo "from nim: -.x", mystr.x
echo "from nim: -.y", mystr.y

printMyStruct(mystr)