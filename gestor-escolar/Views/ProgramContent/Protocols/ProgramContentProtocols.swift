import UIKit

protocol ProgramContentViewProtocol: UIView {
    var didTappedContent: ((String, String) -> Void)? { get set }

    func show(with viewModel: ProgramContentViewModel)
}

protocol ProgramContentViewControllerProtocol: UIViewController {
    func show(with viewModel: ProgramContentViewModel)
    func showAlert(title: String, message: String)
}

protocol ProgramContentPresenterProtocol: AnyObject {
    func showViewModel(with viewModel: ProgramContentViewModel)
    func presentViewModel()
    func sendProgramContent(recnum: String, text: String)
}
