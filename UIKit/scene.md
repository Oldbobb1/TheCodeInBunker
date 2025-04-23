Настройка контроллера кодом в SceneDelegate 
```swift
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        //установка контроллера вместо storyboard
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = CustomNavigationController()
        window.makeKeyAndVisible()
        self.window = window
        //настройка смены темы
        if let theme = UserDefaults.standard.string(forKey: "theme") {
                window.overrideUserInterfaceStyle = theme == "dark" ? .dark : .light
        } else {
            window.overrideUserInterfaceStyle = .unspecified
        }
    }
}
```
