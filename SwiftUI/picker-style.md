# Picker Style 
### AppTheme
Defines three application themes: light, dark, and system. It implements the Identifiable protocol for easy use in the interface.
```swift 
import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case light = "light"
    case dark = "dark"
    case system = "default"

    var id: String { self.rawValue }
}
```
### ContentView
A basic kind of application that allows the user to select a color and theme. It includes a ColorPicker for color selection and multiple Pickers for theme selection with different display styles (automatic, inline, palette and wheel).
```swift 
import SwiftUI

struct ContentView: View {
    @State private var selectedColor: Color = .red
    @State private var selectedTheme: AppTheme = .system
    var body: some View {
        Text("SwiftUI Picker Style")
            .font(.title)
            .bold()
        Form {
            Section {
                ColorPicker("Choose a color", selection: $selectedColor)
                HStack {
                    Text("Selected color:")
                    Spacer()
                    Rectangle()
                        .fill(selectedColor)
                        .frame(width: 40, height: 20)
                        .cornerRadius(8)
                }
            }
            Section {
                Picker("Select Theme", selection: $selectedTheme) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                //                .pickerStyle(.automatic)
            }
            Picker("Select Theme", selection: $selectedTheme) {
                ForEach(AppTheme.allCases) { theme in
                    Text(theme.rawValue).tag(theme)
                }
            }
            .pickerStyle(.inline)
            //                .labelsHidden() //hidden text
            Section {
                Picker("Select Theme", selection: $selectedTheme) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.palette)
            }
            Section {
                Picker("Select Theme", selection: $selectedTheme) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.wheel)
            }
        }
    }
}
```