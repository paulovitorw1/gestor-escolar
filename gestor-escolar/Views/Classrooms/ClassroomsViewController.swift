import UIKit

class ClassroomsViewController: UIViewController {

    weak var delegate: ClassroomsViewControllerDelegate?
    private var contentView: ClassroomsViewProtocol
    private var presenter: ClassroomsPresenterProtocol

    init(contentView: ClassroomsViewProtocol = ClassroomsView(),
         presenter: ClassroomsPresenterProtocol) {
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
        title = "Conteúdo Programático"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: DSColors.black]
        setupViewBindings()
    }

    private func setupViewBindings() {
        contentView.didTappedClassroom = { [weak self] in
            self?.delegate?.didToListContents()
        }
    }
}

extension ClassroomsViewController: ClassroomsViewControllerProtocol {
    func show(with viewModel: [ClassroomsViewModel]) {
        contentView.show(with: viewModel)
    }
}
