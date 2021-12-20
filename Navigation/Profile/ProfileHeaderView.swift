import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.frame = CGRect(x: 16, y: 108, width: 140, height: 140)
        avatarImageView.layer.cornerRadius = 70
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.contents = UIImage(named: "cat")?.cgImage
        avatarImageView.layer.contentsGravity = .resizeAspectFill
        avatarImageView.layer.masksToBounds = true
        return avatarImageView
    }()
    
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 170, y: 120, width: 100, height: 20)
        titleLabel.text = "Hipster cat"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.frame = CGRect(x: 100, y: 294, width: 382, height: 50)
        statusButton.center = CGPoint(x: 207, y: 320)
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 12.0
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4.0
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonPressed),
                               for: .touchUpInside)
        return statusButton
    }()

    var textField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 170, y: 230, width: 150, height: 40)
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged),
                            for: .editingChanged)
        return textField
    }()
    
    var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.frame = CGRect(x: 170, y: 200, width: 150, height: 20)
        statusLabel.text = "Waiting for something"
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        return statusLabel
    }()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let text = textField.text else {return}
        statusText = text
    }
    
    @objc func buttonPressed(sender: UIButton) {
        statusLabel.text = statusText
        print(statusLabel.text ?? "Unknown text")
    }
    
    private func setupUI() {
        addSubview(avatarImageView)
        addSubview(titleLabel)
        addSubview(statusButton)
        addSubview(statusLabel)
        addSubview(textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
}
