import UIKit

final class ProgramContentView: UIView, UITextViewDelegate {
    var didTappedContent: ((String, String) -> Void)?
    private var contentValue: ProgramContentViewModel?

    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "ajshdjahsk"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = DSColors.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let textBox: UITextView = {
        let textBox = UITextView()
        textBox.autocorrectionType = .no
        textBox.textColor = DSColors.black
        textBox.backgroundColor = DSColors.background
        textBox.font = UIFont.preferredFont(forTextStyle: .body)
        textBox.layer.cornerRadius = 20
        textBox.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textBox.layer.shadowColor = UIColor.gray.cgColor;
        textBox.layer.shadowOffset = CGSize(width: 0.75, height: 0.75)
        textBox.layer.shadowOpacity = 0.4
        textBox.layer.shadowRadius = 20
        textBox.layer.masksToBounds = false
        textBox.translatesAutoresizingMaskIntoConstraints = false
        return textBox
    }()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = DSColors.secondary
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = DSColors.background
        textBox.delegate = self
        stupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func stupUI() {
        buildHierarchy()
        applyConstraints()
        addTargetButton()
    }

    private func addTargetButton() {
        saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc
    private func buttonTapped() {
        guard let value = contentValue, !value.text.isEmpty else {
            return
        }

        didTappedContent?(value.recnum, value.text)
    }
    private func buildHierarchy() {
        addSubview(title)
        addSubview(textBox)
        addSubview(saveButton)
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DSSpacing.large),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            textBox.topAnchor.constraint(equalTo: title.bottomAnchor, constant: DSSpacing.small),
            textBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.small),
            textBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.small),
            textBox.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -DSSpacing.large)
        ])

        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.small),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.small),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProgramContentView: ProgramContentViewProtocol {
    func show(with viewModel: ProgramContentViewModel) {
        contentValue = viewModel
        textBox.text = viewModel.text
        title.text = "Conteúdo \(viewModel.date)"
    }
}
