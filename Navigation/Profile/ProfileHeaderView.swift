import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    var avatarContentView: UIView = {
        let avatarContentView = UIView()
        avatarContentView.translatesAutoresizingMaskIntoConstraints = false
        return avatarContentView
    }()
    
    
    var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView(image: UIImage(named: "cat"))
        avatarImageView.layer.cornerRadius = 70
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.contentsGravity = .resizeAspectFill
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    
    var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Hipster cat"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 12.0
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self,
                               action: #selector(buttonPressed),
                               for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()

    var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .white
        statusTextField.font = UIFont.systemFont(ofSize: 15)
        statusTextField.textColor = .black
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.addTarget(self,
                            action: #selector(statusTextChanged),
                            for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something"
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(avatarContentView)
        avatarContentView.addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            avatarContentView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarContentView.widthAnchor.constraint(
                equalToConstant: 140),
            avatarContentView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarContentView.heightAnchor.constraint(
                equalToConstant: 140),
            
            avatarImageView.leadingAnchor.constraint(equalTo: avatarContentView.leadingAnchor),
            avatarImageView.topAnchor.constraint(equalTo: avatarContentView.topAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 140.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 140.0),
            
            setStatusButton.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.safeAreaLayoutGuide.trailingAnchor.constraint(
                equalTo: setStatusButton.trailingAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(
                equalTo: avatarContentView.bottomAnchor, constant: 10),
            setStatusButton.heightAnchor.constraint(
                equalToConstant: 50),
            
            fullNameLabel.leadingAnchor.constraint(
                equalTo: avatarContentView.trailingAnchor, constant: 30),
            fullNameLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            
            statusLabel.leadingAnchor.constraint(
                equalTo: avatarContentView.trailingAnchor, constant: 30),
            statusLabel.topAnchor.constraint(
                equalTo: fullNameLabel.bottomAnchor, constant: 30),
            statusLabel.heightAnchor.constraint(equalToConstant: 15),
            
            statusTextField.leadingAnchor.constraint(
                equalTo: avatarContentView.trailingAnchor, constant: 30),
            statusTextField.topAnchor.constraint(
                equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(
                equalToConstant: 40),
            self.safeAreaLayoutGuide.trailingAnchor.constraint(
                equalTo: statusTextField.trailingAnchor, constant: 16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
}
