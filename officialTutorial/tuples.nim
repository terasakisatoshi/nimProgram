#[ 
A tuple type defines various named fields and an 
order of the fileds. The constructor () can be used to
construct tuples. The order of the fields in the constructor 
must match the order in the tuple's defintion.
Different tupple-types are equivalent if they specify fields of 
the same type and of the same name in the same order.
 ]#


type 
  Person = tuple [name: string, age:int]

var 
  person : Person

person = (name: "Peter", age:30)
#the same, but less readable
person = ("Peter",30)

echo person.name
echo person.age

var building: tuple[street: string, number:int]

building=("Rue del Percebe",13)
echo building.street

var teacher : tuple[name:string,age:int] = ("Mark",43)
person=teacher

echo person