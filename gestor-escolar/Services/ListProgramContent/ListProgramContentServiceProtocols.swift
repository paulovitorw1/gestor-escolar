import Foundation

protocol ListProgramContentAPIServiceProtocol: AnyObject {
    func fetch(completion: @escaping(Result<ListProgramContentModel, Error>) -> Void)
}
