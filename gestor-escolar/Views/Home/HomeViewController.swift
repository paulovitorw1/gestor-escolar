import UIKit

final class HomeViewController: UIViewController {

    weak var delegate: HomeViewControllerDelegate?
    private var contentView: HomeViewProtocol
    private var presenter: HomePresenterProtocol

    init(contentView: HomeViewProtocol = HomeView(),
         presenter: HomePresenterProtocol) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchData()
        setupViewBindings()
    }

    private func setupViewBindings() {
        contentView.didTappedMenu = { [weak self] data in
            guard let viewModel = data else { return }
            self?.delegate?.didToClassrooms(with: viewModel)
        }
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    func show(_ viewModel: HomeViewModel) {
        contentView.show(viewModel)
    }
}
