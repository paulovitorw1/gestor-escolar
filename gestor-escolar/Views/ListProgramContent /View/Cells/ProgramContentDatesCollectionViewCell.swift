import UIKit

final class ProgramContentDatesCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProgramContentDatesCollectionViewCell"

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = DSColors.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = DSColors.background
        addShadow(offset: CGSize(width: 0, height: 2),
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
        addSubview(dateLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        dateLabel.frame = bounds
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.small),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: DSSpacing.small),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: DSSpacing.small),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -DSSpacing.small)
        ])
    }
}

extension ProgramContentDatesCollectionViewCell: ProgramContentDatesCollectionViewCellProtocol {
    func configure(with date: String) {
        dateLabel.text = date
    }
}
