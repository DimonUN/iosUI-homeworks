import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    var tabBatItem: UITabBarItem = {
        let tabBatItem = UITabBarItem()
        tabBatItem.image = .init(systemName: "person.fill")
        tabBatItem.title = "Profile"
        return tabBatItem
    }()
    
    var bottomButton: UIButton = {
        let bottomButton = UIButton()
        bottomButton.backgroundColor = .systemBlue
        bottomButton.setTitle("Button", for: .normal)
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        return bottomButton
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        title = "Profile"
        tabBarItem = tabBatItem
        
        
        view.addSubview(profileHeaderView)
        view.addSubview(bottomButton)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}
