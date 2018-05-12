# mymodule.nim
import nimpy

proc greet(name: string): string {.exportpy.} =
    return "Hello, " & name & "!"

proc get_seq(n: int): seq[int] {.exportpy.} =
  var v = newSeq[int](n)
  for i, _ in v:
    v[i]=i
  result = v

proc get_arr(): array[3, int] {.exportpy.} =
  var v : array[3,int]
  for i, _ in v:
    v[i]= -i
  result = v

proc double_list(int_list: seq[int]): seq[int] {.exportpy.}=
  var ret = newSeq[int](int_list.len)
  for i, v in int_list:
    ret[i]=2*v
  result = ret

proc double_arr(int_arr: array[3, int]): array[3, int] {.exportpy.}=
  var ret: array[3, int]
  for i, v in int_arr:
    ret[i]=2*v
  result = ret