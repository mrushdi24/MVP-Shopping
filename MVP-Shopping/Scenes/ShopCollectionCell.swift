



import UIKit

class ShopCollectionCell: UICollectionViewCell {
    
    lazy var bgView: UIView = {
       let image = UIView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        return image
    }()
    lazy var thumbnail: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .mainLightGray
        return image
    }()
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 15)
        label.numberOfLines = 3
        return label
    }()
    lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial Bold", size: 16)
        label.textColor = .systemRed
        return label
    }()
    lazy var ratingStars: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 12)
        label.textColor = .systemOrange
        return label
    }()
    lazy var ratingCount: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 12)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        addSubViews()
        setupLayoutConstraint()
    }
    func configureViews(){
        backgroundColor = .mainLightGray
        self.bgView.layer.masksToBounds = true
        self.bgView.layer.cornerRadius = 8
        self.thumbnail.layer.masksToBounds = true
        self.thumbnail.layer.cornerRadius = 5
    }
    func addSubViews(){
        addSubview(bgView)
        bgView.addSubview(thumbnail)
        bgView.addSubview(titleLabel)
        bgView.addSubview(priceLabel)
        bgView.addSubview(ratingStars)
        bgView.addSubview(ratingCount)
    }
    func setupLayoutConstraint(){
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10),
        ])
        NSLayoutConstraint.activate([
            priceLabel.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -15),
            priceLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10),
        ])
        NSLayoutConstraint.activate([
            ratingStars.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor, constant: 0),
            ratingStars.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            ratingCount.centerYAnchor.constraint(equalTo: ratingStars.centerYAnchor, constant: 0),
            ratingCount.leadingAnchor.constraint(equalTo: ratingStars.trailingAnchor, constant: 5),
        ])
        DispatchQueue.main.async {
              NSLayoutConstraint.activate([
                self.thumbnail.topAnchor.constraint(equalTo: self.bgView.topAnchor, constant: 5),
                self.thumbnail.leadingAnchor.constraint(equalTo: self.bgView.leadingAnchor, constant: 5),
                self.thumbnail.trailingAnchor.constraint(equalTo: self.bgView.trailingAnchor, constant: -5),
                self.thumbnail.bottomAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: -10),
              ])
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShopCollectionCell: ViewCellProtocol {
    func displayTitle(title: String) {
        titleLabel.text = title
    }
    func displayImage(url: String) {
        CashingImage.shared.KingFisher(thumbnail, url)
    }
    func displayPrice(price: Double) {
        priceLabel.text = "\(price)$"
    }
    func displayRating(rating: Double) {
        ratingStars.text = Helpers.shared.getRatingStars(Int(ceil(rating)))
    }
    func displayRatingCount(rating: Int) {
        ratingCount.text = "(\(rating))"
    }
}
