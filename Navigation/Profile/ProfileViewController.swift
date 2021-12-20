import UIKit

class ProfileViewController: UIViewController {
    
    var frameData = CGRect()
    let profileHeaderView = ProfileHeaderView()
    
    var tabBatItem: UITabBarItem = {
        let tabBatItem = UITabBarItem()
        tabBatItem.image = .init(systemName: "person.fill")
        tabBatItem.title = "Profile"
        return tabBatItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        frameData = self.view.frame
        
        title = "Profile"
        tabBarItem = tabBatItem
        
        view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = frameData
    }
}
