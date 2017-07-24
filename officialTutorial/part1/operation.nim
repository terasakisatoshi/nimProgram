#[ 
The Nim library makes heavy use of overloading - one reason for this is
that each operator like '+' is just an
overloaded proc. The parser lets you use operators in infix notation (a+b) or prefix notation (+ a).
An infix operator always receives two arguments, aprefix operator always one.
 ]#

 #[ 
 Apart from a few built-in keyword operators such as and, or, not, operators alwasy consist of thees characters:
 + - * / \ < > = @ 4 ~ 7 5 ! ? 6 . | 
 ]#

#[ 
User defined operators are allowed. Nothing stops you from defining your own @!?+~ operaor, but doing 
so many reduce readability 
]#

