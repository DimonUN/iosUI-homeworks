import UIKit


class ProfileViewController: UIViewController {
    
fileprivate enum CellReuseIdentifiers: String {
        case posts
    }
    
    lazy var arrayOfPost: [Post] = PostProvider.get()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    fileprivate func setupUI() {
        view.addSubview(tableView)
        navigationController?.navigationBar.isHidden = true
        
        let header = ProfileHeaderView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: 220))
        tableView.tableHeaderView = header
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
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
        arrayOfPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.posts.rawValue, for: indexPath) as? PostTableViewCell else {
            fatalError()
        }
        
        let data = arrayOfPost[indexPath.row]
        cell.update(title: data.title, image: data.image, description: data.description, likes: data.likes, views: data.views)
        
        return cell
    }
}


extension ProfileViewController: UITableViewDelegate {
}








