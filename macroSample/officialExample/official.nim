# to work with Nim syntax trees, we need an API that is defined in the
# ``macros`` module:
import macros

macro debug(n: varargs[untyped]): typed =
  # `n` is a Nim AST that contains a list of expressions;
  # this macro returns a list of statements (n is passed for proper line
  # information):
  result = newNimNode(nnkStmtList, n)
  # iterate over any argument that is passed to this macro:
  for x in n:
    # add a call to the statement list that writes the expression;
    # `toStrLit` converts an AST to its string representation:
    result.add(newCall("write", newIdentNode("stdout"), toStrLit(x)))
    # add a call to the statement list that writes ": "
    result.add(newCall("write", newIdentNode("stdout"), newStrLitNode(": ")))
    # add a call to the statement list that writes the expressions value:
    result.add(newCall("writeLine", newIdentNode("stdout"), x))

var
  a: array[0..10, int]
  x = "some string"
a[0] = 42
a[1] = 45

type 
  Point = ref object of RootObj
    x,y:int

var p = Point(x:4,y:3)

proc `$`(p:Point):string = 
  "x=" & $p.x & ", " & "y=" & $p.y

debug(a[0], a[1], x)
debug(p)