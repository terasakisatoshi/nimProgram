#[
It is quite common to have arrrays start at zero,
so there is a shortcut syntax to specify a range from
zero to the specified index minus one.
]#

type
  NaiveArray = array[0..5,int] # an array that is indexed with 0..5
  QuickArray = array[6,int]# same as NaiveArray

var
  x:NaiveArray
  y:QuickArray

x=[1,3,5,7,9,11]
y=x

for i in low(x)..high(x):
  echo x[i],",",y[i]