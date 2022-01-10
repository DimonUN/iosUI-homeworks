import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Первый пост")
    
    var tabBarFeed: UITabBarItem = {
        let tabBarFeed = UITabBarItem()
        tabBarFeed.image = .init(systemName: "house.fill")
        tabBarFeed.title = "Feed"
        return tabBarFeed
    }()
    
    
    var firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.backgroundColor = .systemBlue
        firstButton.setTitle("Button 1", for: .normal)
        firstButton.setTitleColor(.white, for: .normal)
        firstButton.layer.cornerRadius = 20
        firstButton.layer.borderWidth = 1
        firstButton.layer.borderColor = UIColor.gray.cgColor
        firstButton.addTarget(self,
                              action: #selector(buttonAction),
                              for: .touchUpInside)
        return firstButton
    }()
    
    
    var secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.backgroundColor = .systemCyan
        secondButton.setTitle("Button 2", for: .normal)
        secondButton.setTitleColor(.white, for: .normal)
        secondButton.layer.cornerRadius = 20
        secondButton.layer.borderWidth = 1
        secondButton.layer.borderColor = UIColor.gray.cgColor
        secondButton.addTarget(self,
                               action: #selector(buttonAction),
                               for: .touchUpInside)
        return secondButton
    }()
    
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = "Your feed"
        self.tabBarItem = tabBarFeed
    
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        view.addSubview(stackView)
    
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 150),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            firstButton.widthAnchor.constraint(equalToConstant: 100),
            
            secondButton.heightAnchor.constraint(equalToConstant: 50),
            secondButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }


    
    @objc func buttonAction(sender: UIButton) {
        let vc = PostViewController()
        vc.firstPost = self.post.title
        self.navigationController?.pushViewController(vc, animated: true)
     }
        
}

