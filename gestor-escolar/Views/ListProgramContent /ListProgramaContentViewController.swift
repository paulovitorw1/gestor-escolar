import UIKit

final class ListProgramaContentViewController: UIViewController {

    weak var delegate: ListProgramContentViewControllerDelegate?
    private var contentView: ListProgramContentViewProtocol
    private var presenter: ListProgramContentPresenterProtocol

    init(contentView: ListProgramContentViewProtocol = ListProgramContentView(),
         presenter: ListProgramContentPresenterProtocol) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        title = "Conteudos programaticos"
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        navigationItem.rightBarButtonItem = closeButton
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: DSColors.black]
        setupViewBindings()
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    private func setupViewBindings() {
        contentView.didTappedProgramContent = { [weak self] viewModel in
            self?.closeButtonTapped()
            self?.delegate?.didToProgramContent(with: viewModel)
        }
    }
}

extension ListProgramaContentViewController: ListProgramContentViewControllerProtocol {
    func show(with viewModel: [ProgramContentViewModel]) {
        contentView.show(with: viewModel)
    }
}
