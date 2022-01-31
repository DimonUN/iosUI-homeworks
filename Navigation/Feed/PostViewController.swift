import UIKit

class PostViewController: UIViewController {

    var firstPost: String?
    
    fileprivate func extractedFunc() {
        view.backgroundColor = .yellow
        self.title = firstPost
        
        navigationController?.isNavigationBarHidden = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(openInfoVC))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
    }
    
    
    
    @objc func openInfoVC(sender: UIBarButtonItem) {
        let modalInfoVC = InfoViewController()
        present(modalInfoVC, animated: true, completion: nil)
    }
}
