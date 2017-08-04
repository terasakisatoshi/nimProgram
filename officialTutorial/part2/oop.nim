#[ 
While Nim's support for object oriented programming (OOP) is minimalistic, powerful OOP techniques can be used.
OOP is seen as one way to design a program, not the only way.
Often a procedural approach leas to simpler and more efficient code. In particular,
preffering compositon over inheritance is often the better design.
 ]#

 #[ 
 Like tuples, objects are a means to pack different values together in a structured way.
 However, objects provide many features that tuple do not. They provide inheritance and information hiding.
 Because objects encapsulate data, the T() object constructor should only be used internally and the programmer should provide a proc to
 initialize the object. i.e. constructor
  ]#

type
  Person = ref object of RootObj
    name*: string # the * means that 'name' is accessible from other modules
    age: int #no * means that the field is hidden from other modules.
  Student = ref object of Person #Students inherits from Person
    id:int

var
  student: Student
  person: Person

assert(student of Student)

student = Student(name: "Anton",age:5,id:2)
echo student[]