# Life cycle

- application(_:didFinishLaunchingWithOptions:)<br>
Called at application startup, for initial setup.
```swift
func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication
        .LaunchOptionsKey: Any]?
) -> Bool {
    return true
}
```
- applicationDidBecomeActive(_:)<br>
When the application becomes active.
```swift
func applicationDidBecomeActive(_ application: UIApplication) {
    // Restoring tasks
}
```
- applicationWillResignActive(_:)<br>
When the app becomes inactive.
```swift
func applicationWillResignActive(_ application: UIApplication) {
    // Suspension of tasks
}
```
- applicationDidEnterBackground(_:)<br>
When the application goes into the background.
```swift
func applicationDidEnterBackground(_ application: UIApplication) {
    // Data storage
}
```
- applicationWillEnterForeground(_:)<br>
When the application returns to the foreground.
```swift
func applicationWillEnterForeground(_ application: UIApplication) {
    // Preparing for return
}
```
- applicationWillTerminate(_:)<br>
When the application terminates.
```swift
func applicationWillTerminate(_ application: UIApplication) {
    // Completing tasks
}
```

# Life cycle UIViewController

- viewDidLoad()<br>
Called after the view is loaded.
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    // Interface customization
}
```
- viewWillAppear(_:)<br>
Before the view becomes visible.
```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // Update the data 
}
```
- viewDidAppear(_:)<br>
After the view has become visible.
```swift
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // Start tasks
}
```
- viewWillDisappear(_:)<br>
Before the view becomes invisible.
```swift
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    // Saving data
}
```
- viewDidDisappear(_:)<br>
After the view has become invisible.
```swift
override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    // Release resources
}
```