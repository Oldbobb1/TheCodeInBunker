#жизненный цикл

🟠application(_:didFinishLaunchingWithOptions:)  
Вызывается при запуске приложения, для начальной настройки.
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
}    
🟠applicationDidBecomeActive(_:)  
Когда приложение становится активным.
func applicationDidBecomeActive(_ application: UIApplication) {
    // Восстановление задач
}   
🟠applicationWillResignActive(_:)  
Когда приложение станет неактивным.
func applicationWillResignActive(_ application: UIApplication) {
    // Приостановка задач
}   
🟠applicationDidEnterBackground(_:)  
Когда приложение уходит в фоновый режим.
func applicationDidEnterBackground(_ application: UIApplication) {
    // Сохранение данных
}   
🟠applicationWillEnterForeground(_:)  
Когда приложение возвращается на передний план.
func applicationWillEnterForeground(_ application: UIApplication) {
    // Подготовка к возвращению
}
   
🟠applicationWillTerminate(_:)  
Когда приложение завершает работу.
func applicationWillTerminate(_ application: UIApplication) {
    // Завершение задач
}   







# Ж. ц. UIViewController

🟠viewDidLoad()  
Вызывается после загрузки представления. 
override func viewDidLoad() {
    super.viewDidLoad()
    // Настройка интерфейса
}
   
🟠viewWillAppear(_:)  
Перед тем, как представление станет видимым.
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // Обновление данных
}   
🟠viewDidAppear(_:)  
После того, как представление стало видимым.
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // Запуск задач
}   
🟠viewWillDisappear(_:)  
Перед тем, как представление станет невидимым.
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    // Сохранение данных
}   
🟠viewDidDisappear(_:)  
После того, как представление стало невидимым.
override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    // Освобождение ресурсов
}   