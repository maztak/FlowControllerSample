import UIKit

final class DetailFirstViewController: UIViewController {
    
    weak var delegate: ListViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func buttonDidTap(_ sender: Any) {
        delegate?.pushToSecondView(from: self)
    }
}

extension DetailFirstViewController: StoryboardLoadable {
    static var storyboardName: String {
        return Storyboard.DetailFirstViewController.name
    }
}

