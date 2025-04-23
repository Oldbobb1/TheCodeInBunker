
# При установлении ограничений 

translatesAutoresizingMaskIntoConstraints = false ( по умолчанию = true ) 




# смена цвета по свайпам 
```swift
swipeManager = SwipeGestureManager(
    viewController: self,
    leftAction: { [weak self] in
        self?.view.backgroundColor = .red
    },
    rightAction: { [weak self] in
        self?.view.backgroundColor = .blue
    }
)
```


# Верстка кода

Необходимо удалять storyBoard из info.plist  и вообще везде в проекте где он упоминается 


# UITabBarController

Color for Items: 

- tintColor —> Цвет иконок для выбранных вкладок

- unselectedItemTintColor —> Цвет для невыбранных вкладок 


# Инциализация контроллера программно для UIkit 
```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
//Инициализация 
        let window = UIWindow(windowScene: windowScene)
        let main = MainTabBarController()
        window.rootViewController = main
        window.makeKeyAndVisible()
        self.window = window

    }
}
```










# UITabBar через класс 


Это пример - так не делать а делать через отдельные классы 

class MainTabBarController: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let habitsVC = HabitsViewController()
        habitsVC.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(systemName: "list.bullet"), tag: 0)
        let habitsNav = UINavigationController(rootViewController: habitsVC) // Оборачиваем в UINavigationController
        
        let analyticsVC = HabitDetailViewController()
        analyticsVC.tabBarItem = UITabBarItem(title: "Аналитика", image: UIImage(systemName: "chart.bar"), tag: 1)
        let analyticsNav = UINavigationController(rootViewController: analyticsVC) // Оборачиваем в UINavigationController
        
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gear"), tag: 2)
        let settingsNav = UINavigationController(rootViewController: settingsVC) // Оборачиваем в UINavigationController
        
        viewControllers = [habitsNav, analyticsNav, settingsNav]
        
        tabBar.barTintColor = UIColor.systemBlue
        tabBar.tintColor = UIColor.red // Цвет иконок для выбранных вкладок
        tabBar.unselectedItemTintColor = UIColor.black // Цвет иконок для невыбранных вкладок
    }
}