import Foundation

final class ListProgramContentPresenter: ListProgramContentPresenterProtocol {
    weak var controller: ListProgramContentViewControllerProtocol?
    private let apiService = ListProgramContentService()

    func fecthProgramContents() {
        apiService.fetch { [weak self] result in
            switch result {
            case .success(let answers):
                self?.controller?.show(with: ListProgramContentAdapter.adapt(answers: answers.answers))
            case .failure(let error):
                print(error)
            }
        }
    }
}
