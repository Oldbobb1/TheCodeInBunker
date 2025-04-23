Custom TabBar

Кастомный Таб Бар тот который мне нравится 

```swift
enum Tab {
    case home, calendar, chat, profile
}
``` 
```swift
struct TabButton: View {
    let icon: String
    let tab: Tab
    @Binding var selectedTab: Tab
    var animation: Namespace.ID

    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                selectedTab = tab
            }
        }) {
            ZStack {
                if selectedTab == tab {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .matchedGeometryEffect(id: "tabIndicator", in: animation) // 🔥 Анимированный фон
                        .frame(width: 50, height: 50)
                }

                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .scaleEffect(selectedTab == tab ? 1.2 : 1.0) // 🔥 Анимация увеличения иконки
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: selectedTab)
            }
        }
        .frame(width: 50, height: 50)
    }
}
```
```swift
struct CustomBar: View {
    @Binding var selectedTab: Tab
    @Namespace private var animation // Для плавного перемещения серого круга

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35)
                .fill(Color.black.opacity(0.9)) // Темный фон
                .frame(height: 60)
                .padding(.horizontal, 35)

            HStack(spacing: 40) {
                TabButton(icon: "house.fill", tab: .home, selectedTab: $selectedTab, animation: animation)
                TabButton(icon: "calendar", tab: .calendar, selectedTab: $selectedTab, animation: animation)
                TabButton(icon: "message", tab: .chat, selectedTab: $selectedTab, animation: animation)
                TabButton(icon: "person", tab: .profile, selectedTab: $selectedTab, animation: animation)
            }
            .frame(height: 50)
        }
        .padding(.bottom, 10)
    }
}
```

Hidden TabBar

Скрытие Таб Бар при скроллинге 
```swift
struct ContentView: View {
    @State var ShowTab: Bool = false
    @State private var selectedTab: Tab = .home
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach(0 ..< 15) { item in
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.gray.tertiary)
                        .frame(height: 200)
                }
            }
        }
        .safeAreaPadding(.horizontal, 10)
        .scrollIndicators(.hidden)
        
        .overlay(alignment: .bottom) {
            if ShowTab {
                CustomBar(selectedTab: $selectedTab)
                    .transition(.offset(y: 300))
            }
        }
        .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
            geometry.contentOffset.y
        }, action: { oldValue, newValue in
            if newValue > oldValue {
                withAnimation {
                    ShowTab = false
                }
            } else {
                withAnimation {
                    ShowTab = true
                }
            }
            
        })
    }
}
```

весь код работает совместно 