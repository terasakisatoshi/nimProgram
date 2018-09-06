import macros 

proc hello() = 
  echo "hello"

macro gen_hello(): typed =
  let source = """
    proc hi() =
      echo "hi"
  """
  result = parseStmt(source)

dumpTree:
  proc yahoo() = 
    echo "yahoo (not japan)"

dumpAstGen:
  proc hey() = 
    echo "hey (not jude)"

gen_hello()
hello()
hi()