import Foundation

protocol ClassroomAPIServiceProtocol: AnyObject {
    func fetch(with viewModel: HomeConfigViewModel, completion: @escaping(Result<ClassroomModel, Error>) -> Void)
}
