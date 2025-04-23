Возможность показа без запуска симулятора 

import SwiftUI

struct ViewControllersPreview: UIViewControllerRepresentable {
    let viewControllerGenerator: () -> UIViewController
    init(viewControllerGenerator: @escaping () -> UIViewController) {
        self.viewControllerGenerator = viewControllerGenerator
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        viewControllerGenerator ()
    }
    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {}
}

использование 

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            SettingViewController()
        }.edgesIgnoringSafeArea(.all)
    }
}