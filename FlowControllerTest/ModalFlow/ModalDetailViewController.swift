import UIKit
import Foundation

class ModalDetailViewController: UIViewController {
    
    weak var delegate: ModalViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange
        title = "Modal Detail"
        
        let completionButton = UIButton(frame: .zero)
        completionButton.translatesAutoresizingMaskIntoConstraints = false
        completionButton.setTitle("完了", for: .normal)
        completionButton.setTitleColor(UIColor.white, for: .normal)
        completionButton.backgroundColor = UIColor.blue
        completionButton.addTarget(self, action: #selector(self.completionButtonDidTap(_:)), for: .touchUpInside)
        
        view.addSubview(completionButton)
        
        NSLayoutConstraint.activate([
            completionButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            completionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            completionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            completionButton.heightAnchor.constraint(equalToConstant: 100),
            ])
    }
    
    @objc func completionButtonDidTap(_ sender: UIButton) {
        delegate?.completion()
    }
}
