import Foundation
import UIKit

final class AppFlowController: UIViewController {

    private let dependencyContainer: DependencyContainer

    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = view.bounds
    }

    func start() {
        // 簡略化のためstartLogin()の場合は省略
        startMain()
    }

    fileprivate func startMain() {
        let dependencyContainer = ListDependencyContainer()
        let listFlowController = ListFlowController(
            dependencyContainer: dependencyContainer
        )

        listFlowController.delegate = self
        add(childController: listFlowController)
        listFlowController.start()
    }
    
    fileprivate func startNewModalFlow(from viewController: UIViewController) {
        let dependencyContainer = ListDependencyContainer()
        let newModalFlowController = ModalFlowController(
            dependencyContainer: dependencyContainer
        )
        
        newModalFlowController.delegate = self
        viewController.present(newModalFlowController, animated: true)
        newModalFlowController.start()
    }
}

extension AppFlowController: ListFlowControllerDelegate {
    func remove(flowController: ListFlowController) {
        remove(childController: flowController)
        startMain() // 
    }
    
    func presentNewModalViewController(from viewController: UIViewController) {
        self.startNewModalFlow(from: viewController)
    }
}

extension AppFlowController: ModalFlowControllerDelegate {
    func dismissNewModalFlow(flowController: ModalFlowController) {
        flowController.dismiss(animated: true)
    }
    
    func removeAllChildFlowControllers() {
        self.children.forEach { remove(childController: $0) }
        startMain()
    }
}
