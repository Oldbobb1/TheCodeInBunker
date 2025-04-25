# Picker Style 
```swift 
enum AppTheme: String, CaseIterable, Identifiable {
    case light = "light"
    case dark = "dark"
    case system = "default"
    
    var id: String { self.rawValue }
}
```
```swift 
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
                Picker("Select Theme", selection: $selectedTheme ) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
//                .pickerStyle(.automatic)
            }
                Picker("Select Theme", selection: $selectedTheme ) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.inline)
//                .labelsHidden() //скрывает текст
            Section {
                Picker("Select Theme", selection: $selectedTheme ) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.palette)
            }
            Section {
                Picker("Select Theme", selection: $selectedTheme ) {
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