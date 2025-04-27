# Tips part-1
### Top 10
### №1 
```swift 
ZStack {
Color.mint.opacity(0.5)
Rectangle()
fill (-purple)
frame(width: 100, height: 100)
position(CGPoint(x: 100, y: 100)) ?
Circle(
.fill(.blue)
frame(width: 100, height: 100)
•position(CGPoint(x: 250, y: 250)) ? выравнивание по позиции
}
•frame(width: 350, height: 350)
```
### №2
Используйте модификатор badgeProminence (), чтобы отображать бейджи с меньшей или большей заметностью.
Например, для элементов, требующих действий (например, непрочитанных уведомлений),
передайте .increased, чтобы привлечь больше внимания.
```swift 
List {
Text("Inbox")
.badge(2)
.badgeProminence(.increased)
Text("Drafts")
.badge(5)
.badgeProminence(.decreased)
}
```

### №3
Используйте . safeAreaInset(), чтобы закрепить важные кнопки, например «Продолжить»
на экранах оплаты, внизу, позволяя основному контенту прокручиваться.
```swift 
import SwiftUl
struct ContentView: View {
var body: some View {
MainView()
-safeArealnset(edge: .bottom) {
ActionView
}
}
}
```
### №4 
//Смешивание цветов - лучше градиента
```swift 
struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue.mix(with: .red, by: 0.5)
                .ignoresSafeArea()
        }
    }
}
```
//изменение цвета через слайдер
```swift 
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

Разделитель с текстом 

```swift 
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
//применение 
```swift 
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

изменение размера через слайдер 
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
                        
                        Text("We can’t wait to see what you will Create with Swift.")
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
            
            Slider(value: $frameSize, in: 60...350)  { isEditing in
                self.isEditing = isEditing
            }
            
            Text("Frame size: \(Int(frameSize))")
        }
        .padding()
    }
}
```

### №7

Используй .compositingGroup(), чтобы объединить несколько вью в одну композиционную группу. Это позволяет применять эффекты, такие как blur или opacity, ко всей группе как к единому слою.
without
```swift 
VStack {
RoundedRectangle(cornerRadius: 25)
.fill(.mint)
.frame(width: 350, height: 150)
.offset(v: 50)
.zindex(1)
RoundedRectangle(cornerRadius: 25)
fll(.mint)
.frame(width: 150, height: 350)
}
.shadow(
color: .black.opacity(0,4), 
radius: 30, 
y: 30
)
```
with
```swift 
VStack {
RoundedRectangle(cornerRadius: 25)
.fill(.mint)
.frame(width: 350, height: 150)
.offset(v: 50)
.zindex(1)
RoundedRectangle(cornerRadius: 25)
fll(.mint)
.frame(width: 150, height: 350)
}
.compositingGroup()
.shadow(
color: .black.opacity(0,4), 
radius: 30, 
y: 30
)
```

### №8 

Совет по SwiftUl
Используйте .redacted (reason: .place
holder), чтобы показать заглушку (временное представление), пока ваш контент загружается.
```swift 
ContentView()
.redacted (reason: .placeholder)
```


### №9 

Совет по SwiftUl
Легко добавляйте действия при свайпе для строк в List, используя модификатор
swipeActions ()
Также можно указать направление свайпа с помощью параметра edge.
```swift 
List {
Text("Update Xcode")
swipeActions(edge: leading) {
Button ("Pin", systemlmage: "pin") {}
.tint(purple)
}
.swipeActions(edge: .trailing) {
Button ("Delete", systemlmage: "trash") {}
.tint(.red)
Button("Edit", systemimage: "pencil") {}
.tint(.orange)
}
}
```


### №10

Светящийся border 

```swift 
Text("PREMIUM")
.font(.system(.largeTitle, weight: bold))
overlay {
RoundedRectangle(cornerRadius: 15)
-stroke(LinearGradient(colors: [blue, •purple], startPoint: leading, endPoint: trailing), lineWidth: 5)
shadow(color: Color.teal.opacity (0.9), radius: 10)
frame(width: 225, height: 75)
} 
```