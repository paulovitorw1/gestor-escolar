import Foundation

protocol AuthUserProtocol: AnyObject {
    func show(completion: @escaping(Result<APIResponseAuth, Error>) -> Void)
}
