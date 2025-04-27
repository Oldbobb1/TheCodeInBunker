# Custom TabBar
The provided code implements a custom tab-bar with the ability to hide while scrolling the content.
### Enum Tab 
Defines the available tabs: home, calendar, chat, profile.
```swift
import SwiftUI

enum Tab {
    case home, calendar, chat, profile
}
``` 
### TabButton
A component for each tab button. When the button is clicked, it animates using withAnimation and the icon of the selected tab is enlarged. The background of the button changes to a semi-transparent circle that animates when selected.
```swift
import SwiftUI

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
                        .matchedGeometryEffect(
                            id: "tabIndicator",
                            in: animation
                        )  // 🔥Animated background
                        .frame(width: 50, height: 50)
                }
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .scaleEffect(selectedTab == tab ? 1.2 : 1.0)  // 🔥 Icon zoom animation
                    .animation(
                        .spring(response: 0.5, dampingFraction: 0.7),
                        value: selectedTab
                    )
            }
        }
        .frame(width: 50, height: 50)
    }
}
```
### CustomBar
The main component of the tab-bar that contains buttons for each tab. It has a dark background and sits at the bottom of the screen. Used by Namespace to create a smooth animation of the background moving.
```swift
import SwiftUI

struct CustomBar: View {
    @Binding var selectedTab: Tab
    @Namespace private var animation  // For smooth movement of the gray circle

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35)
                .fill(Color.black.opacity(0.9))  // Dark background
                .frame(height: 60)
                .padding(.horizontal, 35)

            HStack(spacing: 40) {
                TabButton(
                    icon: "house.fill",
                    tab: .home,
                    selectedTab: $selectedTab,
                    animation: animation
                )
                TabButton(
                    icon: "calendar",
                    tab: .calendar,
                    selectedTab: $selectedTab,
                    animation: animation
                )
                TabButton(
                    icon: "message",
                    tab: .chat,
                    selectedTab: $selectedTab,
                    animation: animation
                )
                TabButton(
                    icon: "person",
                    tab: .profile,
                    selectedTab: $selectedTab,
                    animation: animation
                )
            }
            .frame(height: 50)
        }
        .padding(.bottom, 10)
    }
}
```
### ContentView
The main screen of the application, which contains a ScrollView with a grid of items. The tab-bar is hidden when scrolling down and appears when scrolling up. This is achieved by tracking changes in scroll position and animating the visibility of the tab-bar.
```swift
import SwiftUI

struct ContentView: View {
    @State var ShowTab: Bool = false
    @State private var selectedTab: Tab = .home
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach(0..<15) { item in
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
        .onScrollGeometryChange(
            for: CGFloat.self,
            of: { geometry in
                geometry.contentOffset.y
            },
            action: { oldValue, newValue in
                if newValue > oldValue {
                    withAnimation {
                        ShowTab = false
                    }
                } else {
                    withAnimation {
                        ShowTab = true
                    }
                }

            }
        )
    }
}
```
Thus, the code creates an interactive and animated user interface with a tab-bar that adapts to the user's actions.