import UIKit
import Foundation

protocol ModalViewControllerDelegate: class {
    func closeModalView()
    func pushToModalDetail(from: UIViewController)
    func completion()
}

class ModalViewController: UIViewController {
    
    weak var delegate: ModalViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.green
        title = "Modal View"

        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(self.nextButtonDidTap(_:)), for: .touchUpInside)

        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 100),
            ])
        
        let closeButton = UIButton(frame: .zero)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close Modal View", for: .normal)
        closeButton.setTitleColor(UIColor.white, for: .normal)
        closeButton.backgroundColor = UIColor.blue
        closeButton.addTarget(self, action: #selector(self.closeButtonDidTap(_:)), for: .touchUpInside)
        
        view.addSubview(closeButton)

        NSLayoutConstraint.activate([
            closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            closeButton.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -50),
            closeButton.heightAnchor.constraint(equalToConstant: 100),
            ])
    }

    @objc func nextButtonDidTap(_ sender: UIButton) {
        delegate?.pushToModalDetail(from: self)
    }
    
    @objc func closeButtonDidTap(_ sender: UIButton) {
        delegate?.closeModalView()
    }
}
