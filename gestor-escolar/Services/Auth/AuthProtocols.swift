import Foundation

protocol AuthUserProtocol: AnyObject {
    func show(completion: @escaping (APIResponseAuth?) -> Void)
}
