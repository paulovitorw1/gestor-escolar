import Foundation

protocol ClassroomAPIServiceProtocol: AnyObject {
    func show(with viewModel: HomeConfigViewModel, completion: @escaping(Result<ClassroomModel, Error>) -> Void)
}
