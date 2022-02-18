import UIKit


class ProfileViewController: UIViewController {
    
fileprivate enum CellReuseIdentifiers: String {
        case header
        case photos
        case posts
    }
    
    lazy var arrayOfPost: [Post] = PostProvider.get()

    fileprivate enum NumbersOfCellsInTableView {
        static let zeroSection: Int = 1
        static let firstSection: Int = 1
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.toAutoLayout()
        tableView.separatorStyle = .none
        let header = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220))
        tableView.tableHeaderView = header
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        tableView.register(FirstSectionOfTableView.self, forCellReuseIdentifier: CellReuseIdentifiers.header.rawValue)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.photos.rawValue)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.posts.rawValue)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 450
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    
}


extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var n = 0
        switch section {
        case 0:
            n = NumbersOfCellsInTableView.zeroSection
        case 1:
            n = NumbersOfCellsInTableView.firstSection
        default:
            n = arrayOfPost.count
        }
        return n
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.header.rawValue, for: indexPath) as! FirstSectionOfTableView
            cell.selectionStyle = .none
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.photos.rawValue, for: indexPath) as! PhotosTableViewCell
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.posts.rawValue, for: indexPath) as! PostTableViewCell
            
            let data = arrayOfPost[indexPath.row]
            cell.update(title: data.title, image: data.image, description: data.description, likes: data.likes, views: data.views)
            return cell
        }
    }
    
}


extension ProfileViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        guard indexPath.section == 0 else {return}
        print("Did select cell at \(indexPath)")
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
}








