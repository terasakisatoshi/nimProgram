var a="Nim is a Programming language"
var b="Slices are useless."

echo a[7..12] 
b[11..^2]="useful"
echo b


#[ 
"Slices are useless."
 |          |     |
 0         11    17   using indices
^19        ^8    ^2   using ^ syntax
 ]#