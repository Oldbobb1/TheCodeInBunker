# 8 Swift productivity tips
### 1. Use structures, not classes.
Swift encourages the use of structures instead of classes whenever possible. Structures are placed on the stack, which can lead to performance improvements due to faster access and reduced memory overhead.<br>
**Instead of**:
```swift
import UIKit

class User {
    var name: String
    var age: Int
}

init(name: String, age: Int) {
    self.name = name
    self.age = age
}
```
**Use**:
```swift
import UIKit

struct User {
    var name: String
    var age: Int
}
```
**Why?**<br>
Structs provide copy semantics, which can prevent unforeseen side effects and make your code safer. In addition, the compiler can optimize structures more efficiently than classes, resulting in performance gains.
### 2. Lazy properties for resource-intensive initializations.
Lazy properties are only initialized the first time they are accessed, making them an effective way to save resources. This approach is especially useful for properties whose initialization is computationally intensive and may not be required immediately.<br>
**Example**:
```swift
import UIKit

class DataManager {
    lazy var expensiveData: [String] = {
        // Simulating a heavy data-loading process
        var data = [String]()
        for i in 0..<10000 {
            data.append("Item \(i)")
        }
        return data
    }()
}
```
**Why?**<br>
Postponing the initialization of expensive data until it is needed reduces the initial load time of the application, resulting in a faster and smoother user experience.
### 3. Optimizing arrays by preallocating the volume.
When dealing with arrays that grow dynamically, preallocating their size can significantly improve performance by reducing the overhead of multiple memory reallocations.<br>
**Instead of**:
```swift
import UIKit

var numbers = [Int]()
for i in 0..<1000 {
    numbers.append(i)
}
```
**Use this code**:
```swift
import UIKit

var numbers = [Int]()
numbers.reserveCapacity(1000)
for i in 0..<1000 {
    numbers.append(i)
}
```
**Why?**<br>
Volume preallocation allows the array to allocate enough memory in advance to store the expected number of elements. This minimizes resizing and copy operations, which can be costly, especially in performance-critical loops.
### 4. Leverage Swift's parallelism with Async/Await.
Swift's async/await syntax revolutionizes parallel programming by allowing tasks to run asynchronously without blocking the main thread. This modern approach simplifies code and dramatically improves I/O performance.<br>
**Example**:
```swift
import UIKit

func fetchData() async throws -> Data {
    let url = URL(string: "https://api.example.com/data")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

func loadData() {
    Task {
        do {
            let data = try await fetchData()
            // Process data
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
```
**Why?**<br>
Using async/await ensures that your application can handle network requests or other time-consuming tasks without the UI hanging, resulting in a smoother user experience.
### 5. Minimize the use of Optional in performance-critical code.
Optional are invaluable for safely handling missing values, but overusing them in code can lead to unnecessary overhead.<br>
**Instead of**:
```swift
import UIKit

func calculate(_ value: Int?) -> Int {
    guard let unwrapped = value else { return 0 }
    return unwrapped * 2
}
```
**Use**:
```swift
import UIKit

func calculate(_ value: Int) -> Int {
    return value * 2
}
```
**Why?**<br>
By avoiding unnecessary Optionals, you avoid the cost of unrolling and checking for nil, which results in faster execution.	Use Optional only when the absence of a value is significant and unavoidable.
### 6. Use data types to ensure thread safety.
Swift's Value Types, such as structures and enumerations, are inherently thread-safe due to copy-on-assignment behavior. This makes them ideal for concurrent environments.<br>
**Example**:
```swift
import UIKit

struct Point {
    var x: Double
    var y: Double
}

func updatePoint(_ point: Point) -> Point {
    var newPoint = point
    newPoint.x += 10
    newPoint.y += 20
    return newPoint
}
```
**Why?**<br>
Value types prevent data races by ensuring that each thread works with its own copy of the data, eliminating the need for complex synchronization mechanisms.
### 7. Optimization of operations with strings using String API.
Working efficiently with strings is key to avoiding performance bottlenecks in your application. Swift String API provides optimized methods for different tasks.<br>
**Instead**:
```swift
import UIKit

var combined = ""
for word in words {
    combined += word + " "
}
```
**Use**:
```swift
import UIKit

let combined = words.joined(separator: " ")
```
**Why?**<br>
Using joined(separator:)minimizes resource allocation for intermediate strings and improves performance over manual concatenation in loops.<br>
**Совет**
Use Swift's built-in methods to simplify and optimize your work with strings.
### 8. Profiling and benchmarking with Xcode Instruments.
No optimization path is complete without data analysis. Xcode Instruments provides powerful tools for identifying and eliminating performance bottlenecks.<br>
**Why?**<br>
Profiling allows you to focus on real performance issues rather than guesswork, leading to efficient and effective optimizations.
