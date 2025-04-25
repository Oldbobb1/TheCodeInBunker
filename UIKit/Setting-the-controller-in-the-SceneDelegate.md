# Setting the controller in the SceneDelegate
In this example, we configure the application root controller in the `SceneDelegate` class freeing ourselves from the use of Storyboard. This allows us to manage the application lifecycle and set the initial interface. 
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
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ViewController() // Installing the root controller
        window.makeKeyAndVisible() // Making the window visible
        self.window = window // Save the window reference
    }
}
```