import UIKit

class PhotogridCollectionViewCell: UICollectionViewCell {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.layer.cornerRadius = 6.0
        image.layer.contentsGravity = .resizeAspectFill
        image.clipsToBounds = true
        
        return image
    }()


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    public func setup(name: String) {
        image.image = UIImage(named: name)
    }

}
