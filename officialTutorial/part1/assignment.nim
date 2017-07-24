#[The assignment statement
The assignment statement assigns a new value to a variable or more generally to a storage location:
]#

var str = "abc"
echo str

str="xyz"
echo str

var x, y = 3 # assigns 3 to the variables 'x' and 'y'
echo "x ", x
echo "y ", y
x=42 
echo "x ", x #changes 'x' to 42 without changing 'y'
echo "y ", y #y=3