import UIKit

final class ProgramContentViewController: UIViewController {
    weak var delegate: ProgramContentViewControllerDelegate?
    private var contentView: ProgramContentViewProtocol
    private var presenter: ProgramContentPresenterProtocol

    init(contentView: ProgramContentViewProtocol = ProgramContentView(),
         presenter: ProgramContentPresenterProtocol) {
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
        presenter.presentViewModel()
        setupViewBindings()
    }

    private func setupViewBindings() {
        contentView.didTappedContent = { [weak self] recnum, text in
            self?.presenter.sendProgramContent(recnum: recnum, text: text)
        }
    }
}

extension ProgramContentViewController: ProgramContentViewControllerProtocol {
    func show(with viewModel: ProgramContentViewModel) {
        contentView.show(with: viewModel)
    }

    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
