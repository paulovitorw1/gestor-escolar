import UIKit

final class ClassroomCollectionViewCell: UICollectionViewCell {
    static let identifier = "ClassroomCollectionViewCell"
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = DSSpacing.xSmall
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let informationStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = DSSpacing.small
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = DSColors.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let topicLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = DSColors.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let periodTopicLabel: UILabel = {
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
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(informationStackView)
        informationStackView.addArrangedSubview(titleLabel)
        informationStackView.addArrangedSubview(topicLabel)
        informationStackView.addArrangedSubview(periodTopicLabel)
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80)
        ])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}

extension ClassroomCollectionViewCell: ClassroomCollectionViewCellProtocol {
    func configure(with viewModel: ClassroomsViewModel) {
        imageView.image = UIImage(named: "icons8-sala-de-aula-100")
        titleLabel.text = viewModel.title
        topicLabel.text = viewModel.discipline
        periodTopicLabel.text = viewModel.classPeriod
    }
}
