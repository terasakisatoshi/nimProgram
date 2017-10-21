#[
Templates are a simple substitution mechanism that operators on Nim's abstract syntax trees.
Templates are processed in the semantic pass of the compiler.
They integrate well with the rest of language and share none of C's procesosr macros flaws.
]#
template `!=!` (a,b:untyped):untyped = 
  #this definition exists in the System module
  not (a==b)

assert(5!=!6)