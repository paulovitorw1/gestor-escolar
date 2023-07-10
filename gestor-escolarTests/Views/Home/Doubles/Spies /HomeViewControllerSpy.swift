import UIKit

@testable import gestor_escolar

final class HomeViewControllerSpy: UIViewController, HomeViewControllerProtocol {

    private(set) var showCount: Int = 0
    private(set) var receivedViewModel: HomeViewModel?

    func show(_ viewModel: HomeViewModel) {
        showCount += 1
        receivedViewModel = viewModel
    }
}
