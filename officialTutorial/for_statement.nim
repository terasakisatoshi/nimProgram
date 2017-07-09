#[ 
For statement
The for statement is a construct to loop over any element an iterator provides.
The example uses the built-in countup iterator:
 ]#

echo "Counting to ten:"
for i in countup(1,10):
  echo i 
# --> outputs 1 2 3 4 5 6 7 8 9 and 10 on different lines

echo "Counting down from 10 to 1"
for i in countdown(10,1):
  echo i
# --> outputs 10 9 8 7 6 5 4 3 2 and 1 on different lines

#[ 
Zero-indexed counting have two shortcuts ..< and ..^ 
to simplify counting to one less than the higher index:
 ]#

var s = "some string"
for i in 0..<s.len:
  echo s[i]
#[ 
pairs and mpairs which provides the element and an index number 
(immutable and mutable respectively)
 ]#
for index, item in ["a","b"].pairs:
  echo item, " at index ", index
# => a at index 0
# => b at index 1