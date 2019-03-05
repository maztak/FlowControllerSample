import Foundation

enum Storyboard: String  {
    case ListViewController = "ListViewController"
    case DetailFirstViewController = "DetailFirstViewController"

    var name: String {
        return self.rawValue
    }
}
