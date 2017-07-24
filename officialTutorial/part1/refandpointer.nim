
#[ 
Rererences (similar to position in other programmming languages)
are a way to introduce many-to-one relationships.
This means different refernces can point to
and modify the same locaiton in memory.
 ]#

 #[ 
Nim distinguishes between traced and untraced references.
Untraced references are also called pointers.
Traced references point to objects in a garbage collected heap,
untraced references point ot manually allocated objects
(e.g., accessing the hardware), untraced references are necessary.
  ]#

#[ 
Traced references are declared with the 'ref' keyword;
untraced references are declared with the 'ptr' keyword 
The empty [] subscript notation can be used to derefer a reference, 
meaning to retrieve the item the reference
points to. The . access a tuple object field operator and
[] operators perfom implicit dereferencing operators for reference types:
]#

type
  Node = ref NodeObj
  NodeObj = object
    le,ri:Node
    data:int

var
  n:Node
new(n)
n.data = 9


