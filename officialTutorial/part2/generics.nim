#[ Generics are Nim's means to parametrize procs, 
iterators or types with type parameters.
They are most useful for efficient type safe containers.
 ]#

type 
  #binary Tree is a generic type with generic param 'T'
  BinaryTreeObj[T] = object
    le, ri : BinaryTree[T]
    data:T
  BinaryTree*[T] = ref BinaryTreeObj[T]

proc newNode*[T](data:T):BinaryTree[T]=
  #constructor for a node
  new(result)
  result.data=data

proc add*[T](root: var BinaryTree[T],n:BinaryTree[T])=
  #insert a node into the tree
  if root == nil:
    root=n
  else:
    var it=root
    while it!=nil:
      #compare the data items;
      #use the generic ''cmp'' proc
      #that works for any type that has a ``==`` and ``<`` operator
      var c = cmp(it.data,n.data)
      if c < 0:
        if it.le == nil:
          it.le=n
          return
        it=it.le
      else:
        if it.ri==nil:
          it.ri=n
          return
        it=it.ri

proc add*[T](root:var BinaryTree[T],data:T)=
  #convenience proc:
  add(root,newNode(data))

iterator preorder*[T](root:BinaryTree[T]):T=
  var stack:seq[BinaryTree[T]] = @[root]
  while stack.len > 0:
    var n = stack.pop()
    while n != nil:
      yield n.data
      add(stack,n.ri)
      n=n.le

var root:BinaryTree[string]


root.add(newNode("Hello"))
add(root,newNode("World"))

for str in preorder(root):
  stdout.writeLine(str)

