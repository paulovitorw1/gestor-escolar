import UIKit

@testable import gestor_escolar

final class HomeViewSpy: UIView, HomeViewProtocol {
    var didTappedMenu: ((HomeConfigViewModel?) -> Void)?

    private(set) var showCount: Int = 0
    private(set) var receivedViewModel: HomeViewModel?

    func show(_ viewModel: HomeViewModel) {
        showCount += 1
        receivedViewModel = viewModel
    }

    func triggerDidTappedMenu(with viewModel: HomeConfigViewModel) {
        didTappedMenu?(viewModel)
    }
}
