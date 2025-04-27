# Methods 
### Method - pow 
#### Taking a number to a power
The “pow” function is used to raise a number to a power.<br>
The “pow” function takes two arguments of the “Double” type and returns the result of raising the first number to the degree of the second number. 
```swift
import Foundation 

let base = 2.0
let exponent = 3.0
let result = pow(base, exponent)

print(result) // It will output 8.0, since 2^3 = 8
```