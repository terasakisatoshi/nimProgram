import macros 

macro echoName(x: untyped): untyped = 
  let msg = name(x)
  echo msg

proc main(p: int): string{.echoName.} = 
  result "test"

