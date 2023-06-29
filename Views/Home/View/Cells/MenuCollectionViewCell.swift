import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MenuCollectionViewCell"

    private var innerShadow: CALayer = {
        let innerShadow = CALayer()
        innerShadow.masksToBounds = true
        innerShadow.name = "InnerShadow"
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 0)
        innerShadow.shadowOpacity = 1
        innerShadow.shadowRadius = 4

        return innerShadow
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = DSColors.secondaryShades
        addShadow(offset: CGSize(width: 1, height: 1),
                  color: UIColor.black,
                  radius: 2,
                  opacity: 0.3)
        stupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func stupUI() {
        buildHierarchy()
        applyConstraints()
    }

    private func buildHierarchy() {
        addSubview(imageView)
        addSubview(descriptionLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        innerShadow.frame = contentView.bounds
        layer.cornerRadius = 16

        innerShadow.frame = contentView.bounds
        innerShadow.cornerRadius = 16
    }

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                highlight()
            } else {
                unHighlight()
            }
        }
    }

    private func highlight() {
        removeInnerShadow()
        layer.shadowOpacity = 0
    }

    private func unHighlight() {
        addInnerShadow()
        layer.shadowOpacity = 0.3
    }

    private func removeInnerShadow() {
        layer.sublayers?.first { $0.name == "InnerShadow" }?.removeFromSuperlayer()
    }

    private func addInnerShadow() {
        self.layer.addSublayer(innerShadow)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.small),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.large),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.large),
            imageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -DSSpacing.xSmall),
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DSSpacing.small),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}

extension MenuCollectionViewCell: MenuCollectionViewCellProtocol {
    func configure(_ viewModel: HomeMenuViewModel) {
        imageView.image = UIImage(named: viewModel.icon)
        descriptionLabel.text = viewModel.title

    }
}
