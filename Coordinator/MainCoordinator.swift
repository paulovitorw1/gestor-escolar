import UIKit

class MainCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let presenter = HomePresenter()
        let controller = HomeViewController(presenter: presenter)
        controller.delegate = self
        presenter.controller = controller
        navigationController.pushViewController(controller, animated: false)
    }
}

extension MainCoordinator: HomeViewControllerDelegate {
    func didToClassrooms() {
        print(#function)
    }
}
