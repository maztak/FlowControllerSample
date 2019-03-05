import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    func configure(item: Item){
        self.titleLabel.text = item.title
    }
}
