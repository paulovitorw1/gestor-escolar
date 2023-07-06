import Foundation
@testable import gestor_escolar

final class HomePresenterSpy: HomePresenterProtocol {

    private(set) var fetchDataCalledCount = 0
    private(set) var receivedViewModel: HomeViewModel?

    func fetchData() {
        fetchDataCalledCount += 1
        receivedViewModel = .stub()
    }
}
