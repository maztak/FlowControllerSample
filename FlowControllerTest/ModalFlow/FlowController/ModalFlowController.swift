import UIKit

protocol ModalFlowControllerDelegate: class {
    func dismissNewModalFlow(flowController: ModalFlowController)
    func removeAllChildFlowControllers()
}

final class ModalFlowController: UIViewController {
    
    private let dependencyContainer: ListDependencyContainer
    private var embeddedNavigationController: UINavigationController!
    
    weak var delegate: ModalFlowControllerDelegate?
    
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
        let newModalViewController = ModalViewController()
        newModalViewController.delegate = self
        embeddedNavigationController.viewControllers = [newModalViewController]
    }
}

extension ModalFlowController: ModalViewControllerDelegate {
    func closeModalView() {
        delegate?.dismissNewModalFlow(flowController: self)
    }
    
    func pushToModalDetail(from: UIViewController) {
        let modalDetailViewController = ModalDetailViewController()
        modalDetailViewController.delegate = self
        embeddedNavigationController.pushViewController(modalDetailViewController, animated: true)
    }
    
    func completion() {
        delegate?.removeAllChildFlowControllers()
        self.dismiss(animated: true)
    }
}
