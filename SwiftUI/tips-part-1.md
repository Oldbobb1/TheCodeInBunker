# Tips part-1
<!-- ### Top 10 -->
### №1 
Ability to position and overlay elements.
```swift 
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.mint.opacity(0.5)
            Rectangle()
                .fill(Color.purple)
                .frame(width: 100, height: 100)
                .position(CGPoint(x: 100, y: 100))
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .position(CGPoint(x: 250, y: 250))
        }
        .frame(width: 350, height: 350)
    }
}
```
### №2
Use the .badgeProminence() modifier to display badges with less or more prominence.
For example, for items that require action (such as unread notifications), pass .increased to draw more attention.
```swift 
import SwiftUI
struct ContentView: View {
    var body: some View {
        List {
            Text("Inbox")
                .badge(2)
                .badgeProminence(.increased)
            Text("Drafts")
                .badge(5)
                .badgeProminence(.decreased)
        }
    }
}
```
### №3
Use .safeAreaInset() to anchor important buttons, such as "Continue"
on payment screens, at the bottom, allowing the main content to scroll.
### №4 
- Color Mixing.
```swift 
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue.mix(with: .red, by: 0.5)
                .ignoresSafeArea()
        }
    }
}
```
- Changing the color through the slider.
```swift 
import SwiftUI

struct ContentView: View {
    @State private var fraction = 0.5

    var body: some View {
        Color.blue.mix(with: .red, by: fraction, in: .device)
            .overlay {
                Slider(value: $fraction, in: 0...1)
            }
            .animation(.default, value: fraction)
    }
}
```
### №5 
Separator with text.
```swift 
import SwiftUI

struct DividerLine: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.primary)
        }
    }
}
```
### Use
```swift 
import SwiftUI

struct DividerWithText: View {
    var body: some View {
        HStack {
            DividerLine()
            Text("Or")
                .padding(.horizontal)
                .font(.system(.headline).weight(.bold))
            DividerLine()
        }
        .padding(.vertical)
        .padding(.leading)
        .padding(.trailing) 
    }
}
```
### №6 
Resizing via slider.
```swift
struct ContentView: View {
    @State private var frameSize: CGFloat = 350
    @State private var isEditing = false

    var body: some View {
        VStack {
            Spacer()
            VStack {
                ViewThatFits(in: .vertical) {
                    //First Option
                    VStack {
                        Image(systemName: "swift")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text(
                            "We can’t wait to see what you will Create with Swift."
                        )
                    }
                    .font(.system(size: 45))
                    //Second Option
                    Text("Create with Swift")
                        .font(.system(size: 45))
                    //Third Option
                    Text("Swift")
                    //Fourth Option
                    Image(systemName: "swift")
                        .foregroundStyle(.tint)
                }
            }
            .fontWeight(.ultraLight)
            .font(.system(size: 40))
            .frame(width: frameSize, height: frameSize)
            .overlay {
                RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                    .stroke(Color.blue, lineWidth: 1)
            }
            Spacer()
            Slider(value: $frameSize, in: 60...350) { isEditing in
                self.isEditing = isEditing
            }

            Text("Frame size: \(Int(frameSize))")
        }
        .padding()
    }
}
```
### №7
Use .compositingGroup() to combine multiple views into a single compositing group. This allows you to apply effects such as blur or opacity to the entire group as a single layer.
```swift 
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.mint)
                .frame(width: 350, height: 150)
                .offset(y: 50)
                .zIndex(1)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.mint)
                .frame(width: 150, height: 350)
        }
//        .compositingGroup()
        .shadow(
            color: .black.opacity(0.4),
            radius: 30,
            y: 30
        )
    }
}
```
### №8 
Use .redacted (reason: .placeholder) to show a stub (temporary view) while your content is loading.
```swift 
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            View()
                .redacted (reason: .placeholder)
            
        }
    }
}
```
### №9 
Easily add swipe actions for rows in List using the modifier .swipeActions()
You can also specify the swipe direction using the edge parameter.
```swift 
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List {
                Text("Update Xcode")
                swipeActions(edge: .leading) {
                    Button ("Pin", systemImage: "pin"){}
                        .tint(.purple)
                }
                .swipeActions(edge: .trailing) {
                    Button ("Delete", systemImage: "trash"){ }
                        .tint(.red)
                    Button("Edit", systemImage: "pencil") {}
                        .tint(.orange)
                }
            }
        }
    }
}
```
### №10
Luminous border.
```swift 
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("PREMIUM")
                .font(.system(.largeTitle, weight: .bold))
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: 5
                        )
                        .shadow(color: Color.teal.opacity(0.9), radius: 10)
                        .frame(width: 225, height: 75)
                }
        }
    }
}
```