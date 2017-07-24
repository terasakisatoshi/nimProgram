var 
  fruits: seq[string] #reference to a sequence of strings that is initialized with 'nil'
  capitals: array[3,string] #array of strings with a fixed size.

fruits = @[]

capitals=["New York","London","Berlin"]

fruits.add("Banana")
fruits.add("Mango")

#Note: Openarrays can only be used for parameters.
proc openArraySize(oa: openArray[string]): int =
  oa.len

assert openArraySize(fruits)==2
assert openArraySize(capitals)==3