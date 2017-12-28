#[ 
Array are static in size.
You can not add more items to them;
you can only overwrite existing item with data.
This is where Nim's sequences come in.
sequences are dynamic in size and you can grow to as many item as needed.
 ]#

var li:seq[int] = @[]
li.add(1)
assert li[0]==1

let list = @[4,8,15,26,23,42]
for i in 0 .. <list.len:
  stdout.write($list[i] & " ")