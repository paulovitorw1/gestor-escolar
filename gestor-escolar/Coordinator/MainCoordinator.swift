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
    func didToListContents() {
        let presenter = ListProgramContentPresenter()
        let controller = ListProgramaContentViewController(presenter: presenter)
        controller.delegate = self
        presenter.controller = controller
        let navigationController = UINavigationController(rootViewController: controller)
        self.navigationController.present(navigationController, animated: true, completion: nil)
    }
}

extension MainCoordinator: ListProgramContentViewControllerDelegate {
    func didToProgramContent() {
        print(#function)
    }
}
