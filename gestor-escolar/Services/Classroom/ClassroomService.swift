import Foundation

final class ClassroomAPIService: ClassroomAPIServiceProtocol {
    func fetch(with viewModel: HomeConfigViewModel, completion: @escaping(Result<ClassroomModel, Error>) -> Void) {
        let baseUrl = "http://escola.computex.com.br:86/escola910/json_horariop_turmas.php?"
        guard let url = URL(string: baseUrl) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"

        let body = "matricula=\(viewModel.registration)&ano=\(viewModel.year)&codigo_escola=\(viewModel.schoolCode)"
        let finalBody = body.data(using: .utf8)
        request.httpBody = finalBody

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ClassroomModel.self, from: data)
                    completion(.success(response))
                } catch {
                    print("Erro ao decodificar os dados da resposta: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
}
