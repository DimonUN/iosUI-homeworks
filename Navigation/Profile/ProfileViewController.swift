import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    var bottomButton: UIButton = {
        let bottomButton = UIButton()
        bottomButton.backgroundColor = .systemBlue
        bottomButton.setTitle("Button", for: .normal)
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.toAutoLayout()
        return bottomButton
        
    }()
    
    
    fileprivate func setupUI() {
        view.backgroundColor = .lightGray
        
        view.addSubviews(profileHeaderView, bottomButton)
        profileHeaderView.toAutoLayout()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
}
