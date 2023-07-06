import Foundation

@testable import gestor_escolar

final class HomeViewControllerDelegateSpy: HomeViewControllerDelegate {

    private(set) var didToClassroomsCount: Int = 0
    private(set) var receivedViewModel: HomeConfigViewModel?

    func didToClassrooms(with viewModel: HomeConfigViewModel) {
        didToClassroomsCount += 1
        receivedViewModel = viewModel
    }
    
}
