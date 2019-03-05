import UIKit

protocol ListFlowControllerDelegate: class {
    func remove(flowController: ListFlowController)
    func presentNewModalViewController(from viewController: UIViewController)
}

struct ListDependencyContainer {

}

final class ListFlowController: UIViewController {
    private let dependencyContainer: ListDependencyContainer
    private var embeddedNavigationController: UINavigationController!

    weak var delegate: ListFlowControllerDelegate?

    init(dependencyContainer: ListDependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
        embeddedNavigationController = UINavigationController()
        add(childController: embeddedNavigationController)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = view.bounds
    }

    func start() {
        let listViewController = ListViewController.fromStoryboard()
        listViewController.delegate = self
        embeddedNavigationController.viewControllers = [listViewController]
    }
}

extension ListFlowController: ListViewControllerDelegate {
    func pushToFirstView(_ controller: ListViewController, item: Item) {
        let firstViewController = DetailFirstViewController.fromStoryboard()
        firstViewController.delegate = self
        embeddedNavigationController.pushViewController(firstViewController, animated: true)
    }
    
    func pushToSecondView(from viewController: UIViewController) {
        let secondViewController = DetailSecondViewController()
        secondViewController.delegate = self
        embeddedNavigationController.pushViewController(secondViewController, animated: true)
    }
    
    func pushToThirdView(from viewController: UIViewController) {
        let thirdViewController = DetailThirdViewController()
        thirdViewController.delegate = self
        embeddedNavigationController.pushViewController(thirdViewController, animated: true)
    }
    
    func finishWhilePushing() {
        delegate?.remove(flowController: self)
    }
    
    func presentNewModalViewController(from viewContrller: UIViewController) {
        delegate?.presentNewModalViewController(from: viewContrller)
    }
}
