import Foundation

protocol ProgramContentAPIServiceProtocol: AnyObject {
    func sendContent(recnum: String, text: String, completion: @escaping(Result<ProgramContentResponseModel, Error>) -> Void)
}
