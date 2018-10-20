#[ 

Introduction to Metaprogramming in Nim
https://hookrace.net/blog/introduction-to-metaprogramming-in-nim/

 ]#

#[ 
We are in normal programming land here. Regular procedures are what
you know as functions elsewhere and they're pretty easy to define and use
 ]#
proc sayHi(name: string) =
  echo "Hello ", name

sayHi("World")
sayHi "World"
"World".sayHi 

#[ 
With generics we can define procs that work on multiple types.
Actually a new proc will be generated based on our generic definition
for each instantiation
 ]#

proc min[T](x,y:T):T=
  if x<y: x else:y

echo min(3,2)
echo min("foo","bar")

#[ 
Inline iterators are the default iterators in Nim. They get compiled into 
high performance loops:
 ]#

iterator reverseItems(x: string): char = 
  for i in countdown(x.high, x.low):
    yield x[i]

for c in "foo".reverseItems:
  echo c

#We can make iterators generic too
iterator reverseItems[T](x: T):auto = 
  for i in countdown(x.high, x.low):
    yield x[i]

for c in reverseItems([1,2,3,4,5,6]):
  echo c

#[
Inline iterators simultaneously have the advantage and disadvantage of 
being  translated into loops. This means you can not pass them around.
This limitation can be lifted by using closure iterators instead
]#

import math 

proc powers(m: int):auto = 
  return iterator :int =
    for n in 0..int.high:
      yield n^m 
var 
  squares = powers(2) 
  cubes = powers(3)

for i in 1..4:
  echo "Square: ", squares() 

for i in 1..4:
  echo "Cube: ", cubes()

#[ 
Just like templates, macros are executed at compiletime.
But with templates you can only do constant substitutions in the AST.
With macros you can analyze the passed arguments and create a new AST 
at the current position in any way you want.

A simple way to create an AST is to use parseStmt and parseExpr to parse
the regular textual representation into a NimNone. 
 ]#

import macros 

dumpTree:
  result = 10 

static:
 echo treeRepr(parseStmt("result=10"))
 
