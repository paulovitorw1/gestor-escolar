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
    func didToClassrooms(with viewModel: HomeConfigViewModel) {
        let presenter = ClassroomsPresenter(viewModel: viewModel)
        let controller = ClassroomsViewController(presenter: presenter)
        controller.delegate = self
        presenter.controller = controller
        navigationController.pushViewController(controller, animated: true)
    }
}

extension MainCoordinator: ClassroomsViewControllerDelegate {
    func didSeeStudyProgram() {
        let controller = ListProgramaContentViewController()
//        presenter.controller = controller
        navigationController.present(controller, animated: true)
    }
}
