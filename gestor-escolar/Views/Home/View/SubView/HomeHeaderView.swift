import UIKit

final class HomeHeaderView: UIView {

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
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
//        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = DSColors.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subTitleLabel: UILabel = {
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
        informationStackView.addArrangedSubview(subTitleLabel)
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

extension HomeHeaderView: HomeHeaderViewProtocol {
    func show(_ viewModel: HomeConfigViewModel) {
        imageView.image = UIImage(named: "imagenslogotipo.png")
        titleLabel.text = viewModel.nameScholl
        subTitleLabel.text = viewModel.nameUser
    }
}
