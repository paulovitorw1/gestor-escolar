import Foundation

final class ProgramContentService: ProgramContentAPIServiceProtocol {
    func sendContent(recnum: String, text: String, completion: @escaping (Result<ProgramContentResponseModel, Error>) -> Void) {
        let baseUrl = "http://escola.computex.com.br:86/escola910/json_grava_conteudo_programatico.php"
        guard let url = URL(string: baseUrl) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            return
        }

        let requestBody: [String: Any] = [
            "matricula": "1091",
            "senha": "11111111",
            "resposta": [
                "recnum": recnum,
                "texto": text
            ]
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue(String(requestBody.description.count), forHTTPHeaderField: "Content-Length")

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            request.httpBody = jsonData
        } catch {
            print("Erro ao converter o corpo de dados em JSON: \(error)")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ProgramContentResponseModel.self, from: data)
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
