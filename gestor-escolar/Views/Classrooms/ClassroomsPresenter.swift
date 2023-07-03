import Foundation

final class ClassroomsPresenter {
    weak var controller: ClassroomsViewControllerProtocol?

    let viewModel: HomeConfigViewModel
    private let apiService = ClassroomAPIService()

    init(viewModel: HomeConfigViewModel) {
        self.viewModel = viewModel
        self.fecthClassrooms(with: viewModel)
    }
    
    func fecthClassrooms(with viewModel: HomeConfigViewModel) {
        apiService.fetch(with: viewModel) { [weak self] result in
            switch result {
            case .success(let classrooms):
                self?.controller?.show(with: ClassroomModelAdapter.adapt(classrooms: classrooms.classrooms))
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ClassroomsPresenter: ClassroomsPresenterProtocol {
    
}
