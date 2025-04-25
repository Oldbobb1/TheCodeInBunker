# Other
### In setting limits
- translatesAutoresizingMaskIntoConstraints = false ( по умолчанию = true ) 

### Code layout 
It is necessary to remove all references to the storyboard from the project:
- Remove the storyboard file from the project.
- In Info.plist, remove the Main storyboard file base name key.
- Check the code for references to storyboard and remove them.
- Configure SceneDelegate to initialize the root controller without storyboard.

### UITabBar via class
<!-- This is an example - don't do it this way, but do it through separate classes.  -->
```swift
import UIKit 

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let habitsVC = HabitsViewController()
        habitsVC.tabBarItem = UITabBarItem(
            title: "Habit",
            image: UIImage(systemName: "list.bullet"),
            tag: 0
        )
        let habitsNav = UINavigationController(rootViewController: habitsVC)

        let analyticsVC = HabitDetailViewController()
        analyticsVC.tabBarItem = UITabBarItem(
            title: "Static",
            image: UIImage(systemName: "chart.bar"),
            tag: 1
        )
        let analyticsNav = UINavigationController(
            rootViewController: analyticsVC
        )

        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(
            title: "Setting",
            image: UIImage(systemName: "gear"),
            tag: 2
        )
        let settingsNav = UINavigationController(rootViewController: settingsVC)

        viewControllers = [habitsNav, analyticsNav, settingsNav]

        tabBar.barTintColor = UIColor.systemBlue
        tabBar.tintColor = UIColor.red  // Icon color for selected tabs
        tabBar.unselectedItemTintColor = UIColor.black  // Icon color for unselected tabs
    }
}
```

### Сustomizing the interface theme 
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
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        self.window = window
        // customizing the interface theme
        if let theme = UserDefaults.standard.string(forKey: "theme") {
            window.overrideUserInterfaceStyle = theme == "dark" ? .dark : .light
        } else {
            window.overrideUserInterfaceStyle = .unspecified
        }
    }
}
```