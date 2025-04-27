# Tips part-2
<!-- ### Top 10 -->
### №1 Opening the screen halfway. 
```swift 
 .presentationDetents([.fraction(0.5)])
```
**Use**:
```swift 
import SwiftUI

struct ContentView: View {
    @State private var subscription = false
    var body: some View {
        VStack {
            Button ("Delete", systemImage: "trash"){ }
                .sheet(isPresented: $subscription) {
                    ContentView1()
                }
                .presentationDetents([.fraction(0.5)])
        }
    }
}
```
### №2 Autofill.
```swift 
import SwiftUI

struct ContentView: View {
    @State private var code = ""
    var body: some View {
        TextField ("Enter Verification Code", text: $code)
            .textContentType(.oneTimeCode)
            .keyboardType(.numberPad)
            .padding()
    }
}
```
### №3
#### Create tabs to display boat, wind, and water condition information using page style.
```swift 
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Boat", systemImage: "sailboat") {
                BoatView()
            }
            Tab("Wind", systemImage: "wind") {
                WindConditionView()
            }
            Tab("Sea", systemImage: "water.waves") {
                WaterConditionView()
            }
        }
        .tabViewStyle(.page)
    }
}
```
#### Implementation of a tab with a side menu to navigate between screens.
```swift
import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Tab("Boat", systemImage: "sailboat") {
                BoatView()
            }
            Tab("Wind", systemImage: "wind") {
                WindConditionView()
            }
            Tab("Sea", systemImage: "water.waves") {
                WaterConditionView()
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}
```
#### Adds a side menu with navigation and additional tabs for maps and compass.
```swift
import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Tab("Boat", systemImage: "sailboat") {
                BoatView()
            }
            Tab("Wind", systemImage: "wind") {
                WindConditionView()
            }
            Tab("Sea", systemImage: "water.waves") {
                WaterConditionView()
            }
            TabSection {
                Tab("Maps", systemImage: "map") {
                    Text("Maps")
                }
                Tab("Compass", systemImage: "safari") {
                    Text("Compass")
                }
            } header: {
                Label("Navigation", systemImage: "folder")
            }
            .sectionActions {
                Button("Add new destination") {}
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}
```
#### Saves custom tab settings using @AppStorage.
```swift
import SwiftUI

struct ContentView: View {
    @AppStorage("sidebarCustomization") var sidebarCustomization:
        TabViewCustomization

    var body: some View {
        TabView {
            Tab("Boat", systemImage: "sailboat") {
                BoatView()
            }
            .customizationID("com.Sailwise.Boat")

            Tab("Wind", systemImage: "wind") {
                WindConditionView()
            }
            .customizationID("com.Sailwise.Wind")

            Tab("Sea", systemImage: "water.waves") {
                WaterConditionView()
            }
            .customizationID("com.Sailwise.Sea")

            TabSection {
                Tab("Maps", systemImage: "map") {
                    Text("Maps")
                }
                .customizationID("com.Sailwise.Maps")

                Tab("Compass", systemImage: "safari") {
                    Text("Compass")
                }
                .customizationID("com.Sailwise.Compass")
            } header: {
                Label("Navigation", systemImage: "folder")
            }
            .customizationID("com.Sailwise.NavigationSection")
            .sectionActions {
                Button("Add new destination") {}
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($sidebarCustomization)
    }
}
```
#### Allows you to drag and drop tabs to change their order in the side menu.
```swift
import SwiftUI

struct ContentView: View {
    @AppStorage("sidebarCustomization") var sidebarCustomization:
        TabViewCustomization

    var body: some View {
        TabView {
            Tab("Boat", systemImage: "sailboat") {
                BoatView()
                    .draggable("boat")
            }
            .customizationID("com.Sailwise.Boat")

            Tab("Wind", systemImage: "wind") {
                WindConditionView()
                    .draggable("wind")
            }
            .customizationID("com.Sailwise.Wind")

            Tab("Sea", systemImage: "water.waves") {
                WaterConditionView()
                    .draggable("Water")
            }
            .customizationID("com.Sailwise.Sea")

            TabSection {
                Tab("Maps", systemImage: "map") {
                    Text("Maps")
                        .draggable("Maps")
                }
                .customizationID("com.Sailwise.Maps")

                Tab("Compass", systemImage: "safari") {
                    Text("Compass")
                        .draggable("Maps")
                }
                .customizationID("com.Sailwise.Compass")
            } header: {
                Label("Navigation", systemImage: "folder")
            }
            .customizationID("com.Sailwise.NavigationSection")
            .sectionActions {
                Button("Add new destination") {
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($sidebarCustomization)
    }
}
```
####
```swift
import SwiftUI

struct BoatView: View {
    var body: some View {
        Text("HEllo word")
    }
}

struct WindConditionView: View {
    var body: some View {
        Text("HEllo word")
    }
}

struct WaterConditionView: View {
    var body: some View {
        Text("HEllo word")
    }
}
```