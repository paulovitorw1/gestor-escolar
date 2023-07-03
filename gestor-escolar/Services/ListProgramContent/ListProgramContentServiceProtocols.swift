import Foundation

protocol ListProgramContentAPIServiceProtocol: AnyObject {
    func fetch(with viewModel: ClassroomForProgramContentViewModel, completion: @escaping(Result<ListProgramContentModel, Error>) -> Void)
}
