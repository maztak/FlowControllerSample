import UIKit

struct DependencyContainer {
    static func make() -> DependencyContainer {
        return DependencyContainer()
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appFlowController: AppFlowController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appFlowController = AppFlowController(dependencyContainer: DependencyContainer.make())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appFlowController
        window?.makeKeyAndVisible()

        appFlowController.start()

        return true
    }
}

