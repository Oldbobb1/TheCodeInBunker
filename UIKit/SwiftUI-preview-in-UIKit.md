# SwiftUI Preview in UIKit 
Preview Option "UIViewController" in UIKit.

#### ViewControllersPreview 
```swift
import SwiftUI

struct ViewControllersPreview: UIViewControllerRepresentable {
    let viewControllerGenerator: () -> UIViewController
    init(viewControllerGenerator: @escaping () -> UIViewController) {
        self.viewControllerGenerator = viewControllerGenerator
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        viewControllerGenerator()
    }
    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {}
}
```

#### Utilization
```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            UIViewController()
        }.edgesIgnoringSafeArea(.all)
    }
}
```