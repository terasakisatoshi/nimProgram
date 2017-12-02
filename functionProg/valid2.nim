import future
proc isValid(x: int, validator: (x: int)->bool)=
  if validator(x):
    echo(x," is valid")
  else:
    echo(x," is not valid")

proc validatorTest(x: int):bool=
  return x mod 2 == 0

if isMainmodule:
  isValid(2,validatorTest)
  isValid(3,validatorTest)
