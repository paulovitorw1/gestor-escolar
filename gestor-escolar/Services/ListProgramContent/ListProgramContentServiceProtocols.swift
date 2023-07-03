import Foundation

protocol ListProgramContentAPIServiceProtocol: AnyObject {
    func fetch(with viewModel: HomeConfigViewModel, completion: @escaping(Result<ClassroomModel, Error>) -> Void)
}
