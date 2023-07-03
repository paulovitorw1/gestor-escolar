import UIKit

final class ListProgramaContentViewController: UIViewController {

    weak var delegate: ListProgramContentViewControllerDelegate?
    private var contentView: ListProgramContentViewProtocol
//    private var presenter: ListProgramContentPresenterProtocol

    init(contentView: ListProgramContentViewProtocol = ListProgramContentView()) {
        self.contentView = contentView
//        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        title = "Conteudos programaticos"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: DSColors.black]

    }

    private func setupViewBindings() {
        contentView.didTappedClassroom = { [weak self] in
            self?.delegate?.didSeeStudyProgram()
        }
    }


}
