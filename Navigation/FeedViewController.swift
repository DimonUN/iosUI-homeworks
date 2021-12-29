import UIKit

class FeedViewController: UIViewController {
    
    var tabBarFeed: UITabBarItem = {
        let tabBarFeed = UITabBarItem()
        tabBarFeed.image = .init(systemName: "house.fill")
        tabBarFeed.title = "Feed"
        return tabBarFeed
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Your feed"
        tabBarItem = tabBarFeed
        
    }
}
