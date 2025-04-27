# Animating elements in ScrollView using SwiftUI
### Option 1
The first option uses scrollTransition to create an interactive animation. 
ColorView elements are scaled down by 20% as you scroll, creating a “zoom in” or “zoom out” effect.
```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                ForEach(0..<10) { index in
                    ColorView(index: index)
                        .frame(height: 200)
                        .scrollTransition(
                            .interactive(timingCurve: .easeInOut),
                            axis: .vertical
                        ) { content, phase in
                            let scaledContent = content.scaleEffect(
                                phase.isIdentity ? 1 : -0.2 * phase.value
                            )
                            return scaledContent
                        }
                }
            }
            .padding()
        }
    }
}
```
### Option 2
Here the animation is more complex: two configurations are used - topLeading and bottomTrailing. The elements rotate by -90 degrees and zoom in by 50%, as well as smoothly disappear when scrolling, creating a dynamic visual effect.
```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                ForEach(0..<10) { index in
                    ColorView(index: index)
                        .frame(height: 200)
                        .scrollTransition(
                            // The topLeading configuration
                            topLeading: .interactive(timingCurve: .easeIn),
                            // The bottomTrailing configuration
                            bottomTrailing: .animated(.bouncy(duration: 0.8)),
                            // The axis
                            axis: .vertical
                        ) { content, phase in
                            content
                                // The transition for the topLeading configuration
                                .rotationEffect(
                                    .degrees(
                                        phase == .topLeading
                                            ? -90 * phase.value : 0
                                    )
                                )
                                // The transition for the bottomTrailing configuration
                                .scaleEffect(
                                    phase == .bottomTrailing
                                        ? 1 + 0.5 * phase.value : 1
                                )
                                // Fading in and out
                                .opacity(1 - phase.value)
                        }
                }
            }
            .padding()
        }
    }
}
```
### ColorView
Displays colored rectangles with rounded corners and text indicating the item number. The colors are selected from an array, which adds variety.
```swift
import SwiftUI

struct ColorView: View {
    let index: Int
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(colorForIndex(index))
            .overlay(
                Text("Item \(index + 1)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            )
    }
    func colorForIndex(_ index: Int) -> Color {
        let colors: [Color] = [
            .red, .orange, .yellow, .green, .blue, .purple, .pink, .teal, .cyan,
            .brown
        ]
        return colors[index % colors.count]
    }
}
```