import Foundation

@testable import gestor_escolar

enum MockAuthUserServiceError: Error {
    case noMockResponse
}

final class MockAuthUserService: AuthUserProtocol {

    var mockResponse: Result<APIResponseAuth, Error>?

    func show(completion: @escaping (Result<APIResponseAuth, Error>) -> Void) {
        DispatchQueue.main.async {
            completion(self.mockResponse ?? .failure(MockAuthUserServiceError.noMockResponse))
        }
    }
}
