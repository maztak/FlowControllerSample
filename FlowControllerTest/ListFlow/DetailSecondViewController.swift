import UIKit

class DetailSecondViewController: UIViewController {
    
    weak var delegate: ListViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        title = "Detail Second"

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
    }

    @objc func nextButtonDidTap(_ sender: UIButton) {
        delegate?.pushToThirdView(from: self)
    }
}
