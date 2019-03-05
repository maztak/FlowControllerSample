import UIKit
import Foundation

class DetailThirdViewController: UIViewController {
    
    weak var delegate: ListViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red
        title = "Detail Third"

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
        
        let finishButton = UIButton(frame: .zero)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        finishButton.setTitle("Finish While Pushing", for: .normal)
        finishButton.setTitleColor(UIColor.white, for: .normal)
        finishButton.backgroundColor = UIColor.blue
        finishButton.addTarget(self, action: #selector(self.finishButtonDidTap(_:)), for: .touchUpInside)
        
        view.addSubview(finishButton)
        
        NSLayoutConstraint.activate([
            finishButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            finishButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            finishButton.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -50),
            finishButton.heightAnchor.constraint(equalToConstant: 100),
            ])
    }

    @objc func nextButtonDidTap(_ sender: UIButton) {
        delegate?.presentNewModalViewController(from: self)
    }
    
    @objc func finishButtonDidTap(_ sender: UIButton) {
        self.delegate?.finishWhilePushing()
    }
}
