import Foundation

final class APIService: AuthUserProtocol {
    func show(completion: @escaping (APIResponseAuth?) -> Void) {
        let matricula = "1091"
        let senha = "11111111"
        let token = "X"
        let so = "ios"

        let baseUrl = "http://escola.computex.com.br:86/escola910/mobile_login.php"
        let urlString = "\(baseUrl)?matricula=\(matricula)&senha=\(senha)&token=\(token)&so=\(so)"

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(APIResponseAuth.self, from: data)
                    completion(response)
                } catch {
                    print("Erro ao decodificar os dados da resposta: \(error.localizedDescription)")
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }

        task.resume()
    }
}
