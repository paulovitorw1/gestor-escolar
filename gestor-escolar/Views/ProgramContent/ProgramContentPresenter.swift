import Foundation

final class ProgramContentPresenter: ProgramContentPresenterProtocol {
    weak var controller: ProgramContentViewControllerProtocol?
    private let apiService = ProgramContentService()
    private let viewModel: ProgramContentViewModel

    init(viewModel: ProgramContentViewModel) {
        self.viewModel = viewModel
    }

    func presentViewModel() {
        showViewModel(with: viewModel)
    }

    func showViewModel(with viewModel: ProgramContentViewModel) {
        self.controller?.show(with: viewModel)
    }

    func sendProgramContent(recnum: String, text: String) {
        apiService.sendContent(recnum: recnum, text: text) { [weak self] result in
            switch result {
            case .success(let message):
                self?.controller?.showAlert(title: "Sucesso", message: message.message)
            case .failure(let error):
                self?.controller?.showAlert(title: "Erro", message: error.localizedDescription)
            }
        }
    }
}
