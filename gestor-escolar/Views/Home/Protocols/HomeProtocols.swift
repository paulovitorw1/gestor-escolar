import UIKit

protocol HomeViewProtocol: UIView {
    var didTappedMenu: ((HomeConfigViewModel?) -> Void)? { get set }

    func show(_ viewModel: HomeViewModel)
}

protocol MenuCollectionViewCellProtocol: UICollectionViewCell {
    func configure(_ viewModel: HomeMenuViewModel)
}

protocol HomeViewControllerProtocol: UIViewController {
    func show(_ viewModel: HomeViewModel)
}

protocol HomePresenterProtocol: AnyObject {
    func fetchData()
}

protocol HomeViewControllerDelegate: AnyObject {
    func didToClassrooms(with viewModel: HomeConfigViewModel)
}

protocol HomeHeaderViewProtocol: UIView {
    func show(_ viewModel: HomeConfigViewModel)
}
