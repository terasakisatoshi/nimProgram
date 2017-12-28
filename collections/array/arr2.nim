#[ 
It is possible to define arrays with a custom range.
This is useful when your array indices does not start at 0.
 ]#

var list: array[-10 .. 4,int]
list[-10]=4
list[4]=5
echo list.repr