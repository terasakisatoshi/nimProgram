#[ 
To call a procedure that returns a value just for
its side effects an ignoring its return value,
a discard statement must be use. Nim does not allow silently throwing away a return value:
]#


proc plusWillDiscard(x,y:int):int = 
  return x + y

discard plusWillDiscard(3,4)
#example:
#this code causes an error
#Error: expression 'plus(3, 4)' is of type 'int' and has to be discarded
#[
proc plus(x,y:int):int = 
  return x+y

plus(3,4)
]#

proc plus(x,y:int):int {.discardable.} = 
  return x + y

plus(3,4)


