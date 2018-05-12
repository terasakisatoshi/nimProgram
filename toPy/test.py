# test.py
import mymodule
import numpy as np
import array
print(mymodule.greet("Hi"))
print(mymodule.get_seq(3))
print(mymodule.get_arr())
print(mymodule.double_list([3, 2, 1]))
print(type(mymodule.double_list([3, 2, 1])))
arr = (3, 2, 1)
arr = array.array('i', [1, 2, 3])
print(mymodule.double_arr([1, 2, 3]))
