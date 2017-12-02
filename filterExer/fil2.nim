import sequtils
import future
let numbers = @[1,2,3,4,5,6]
let odds = filter(numbers,(x: int) -> bool => x mod 2 != 0)
assert odds== @[1,3,5]
echo odds