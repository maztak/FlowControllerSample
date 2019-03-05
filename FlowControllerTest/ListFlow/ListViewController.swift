import UIKit

protocol ListViewControllerDelegate: class {
    func pushToFirstView(_ controller: ListViewController, item: Item)
    func pushToSecondView(from viewController: UIViewController)
    func pushToThirdView(from viewController: UIViewController)
    func finishWhilePushing()
    func presentNewModalViewController(from viewController: UIViewController)
}

final class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var sampleItems: [Item] = [Item(title: "article1"), Item(title: "article2"), Item(title: "article3")]

    weak var delegate: ListViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        _setupUI()
    }

    private func _setupUI() {
        navigationItem.title = "List"
        definesPresentationContext = true
        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ItemTableViewCell.self)
    }
}

extension ListViewController {
    func showList() {
        tableView.reloadData()
    }

    func showDetail(item: Item) {
        delegate?.pushToFirstView(self, item: item)
    }
}

extension ListViewController: StoryboardLoadable {
    static var storyboardName: String {
        return Storyboard.ListViewController.name
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        cell.titleLabel.text = sampleItems[indexPath.row].title
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        delegate?.pushToFirstView(self, item: sampleItems[indexPath.row])
    }
}
