import Foundation

protocol AuthUser: AnyObject {
    func show(completion: @escaping(Result<[APIResponseAuth], Error>) -> Void)
}
