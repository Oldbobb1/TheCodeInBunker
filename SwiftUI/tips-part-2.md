# Tips part-2
<!-- ### Top 10 -->
### №1 Открытие экрана наполовину 
```swift 
 .presentationDetents([.fraction(0.5)]) -> экран по умолчанию открывается на половину 
```
а прописывать после созданной кнопки -> 
```swift 
Button { }
 .sheet(isPresented: $subscription) {
                            SignInView()
                                .presentationDetents([.fraction(0.5)])
                        }
```

### №2 
Автозаполнение 

аналогично тому как приходит код для приложения  
```swift 
import SwiftUl
struct ContentView: View {
@State private var code = ""
var body: some View {
TextField ("Enter Verification Code", text: Scode) 
.textContentType(.oneTimeCode)
.keyboard Type(.numberPad)
.padding()
}
}
```

### №3

//подходит для ios и ipad
```swift 
import SwiftUI

struct ContentView1: View {

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

//другой внешний вид
struct ContentView2: View {

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

//боковое меню с навигацией в отличие от кода выше
struct ContentView3: View {

    var body: some View {
        TabView {
            Tab("Boat", systemImage: "sailboat"){
                BoatView()
            }
            Tab("Wind", systemImage: "wind"){
                WindConditionView()
            }
            Tab("Sea", systemImage: "water.waves"){
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
                Button("Add new destination"){}
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
    
}

//сохранение вкладок
struct ContentView4: View {
    @AppStorage("sidebarCustomization") var sidebarCustomization: TabViewCustomization
    
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
                Button("Add new destination") { }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($sidebarCustomization)
    }
    
}

//сохранение и применение
struct ContentView5: View {

    @AppStorage("sidebarCustomization") var sidebarCustomization: TabViewCustomization
    
    var body: some View {
        TabView{
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
                Button("Add new destination"){
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($sidebarCustomization)
    }
    
}

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