import Foundation

final class ListProgramContentPresenter: ListProgramContentPresenterProtocol {
    weak var controller: ListProgramContentViewControllerProtocol?
    private let apiService = ListProgramContentService()
    let viewModel: ClassroomForProgramContentViewModel

    init(viewModel: ClassroomForProgramContentViewModel) {
        self.viewModel = viewModel
        fecthProgramContents(with: viewModel)
    }
    
    func fecthProgramContents(with viewModel: ClassroomForProgramContentViewModel) {
        apiService.fetch(with: viewModel) { [weak self] result in
            switch result {
            case .success(let answers):
                self?.controller?.show(with: ListProgramContentAdapter.adapt(answers: answers.answers))
            case .failure(let error):
                print(error)
            }
        }
    }
}
