# Swift Style Code
- [Swift Style Code Documentation](https://google.github.io/swift/#function-declarations)
- Formatting of arguments in functions - each argument on a new line, aligned by indentation.<br>

**Example**: 
```swift
import UIKit

public static func makeLabel(
    text: String? = nil,
    fontSize: CGFloat,
    weight: UIFont.Weight,
    textColor: UIColor? = nil,
    textAlignment: NSTextAlignment? = nil,
    numberOfLines: Int? = nil,
    backgroundColor: UIColor? = nil,
    clipsToBounds: Bool? = nil,
    cornerRadius: CGFloat? = nil
) -> UILabel {
    let label = UILabel()
    label.text = text
    label.textColor = textColor
    label.textAlignment = textAlignment ?? .natural
    label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    label.numberOfLines = numberOfLines ?? 0
    label.backgroundColor = backgroundColor
    label.clipsToBounds = clipsToBounds ?? false
    label.layer.cornerRadius = cornerRadius ?? 0
    return label
}
```
- Comma indents
```swift
(width: 10, height: 20)
```
- Explicit type specification when initializing variables
```swift
let number: Int = 5
```
- Implicit type specification when initializing variables
```swift
let number = 5
```
- Function length - no more than 15-20 lines. (One function - one logical action.)
- The number of function parameters - no more than 5. (If more - combine parameters into a structure or pass them through the model).
- If there are more than three if conditions, use switch.
- In case of simple checks, the if-else if cascade is acceptable, but with explicit readability.
- The names of functions and variables are descriptive and telling (without abbreviations).
### Avoid code duplication.
- Overused features
- Generics
- Classes / Structures
- Extensions and protocols
### Unloading ViewController / ContentView
- The main controller should not contain heavy logic, view and business logic should be moved to separate classes/structures.
- In **UIKit** - allocate custom UIViews and managers (manager, viewModel).
- In **SwiftUI** - split into nested views, use auxiliary models and services.
