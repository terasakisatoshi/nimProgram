#When statement

when system.hostOS == "Windows":
  echo "running on Windows"
elif system.hostOS == "linux":
  echo "running on linux"
elif system.hostOS == "macosx":
  echo "running on Mac OS X!"
else:
  echo "unknown operating system"


#[ 
The when statement is almost identical to the if statement, but with these differences:

: Each condition must be a constant expression since it is evaluated by the compiler.
: The statements within a branch do not open a new scope.
: The compiler checks the semantics and produces code only for the statements that belong to the first condition that evaluates to true.
 ]#