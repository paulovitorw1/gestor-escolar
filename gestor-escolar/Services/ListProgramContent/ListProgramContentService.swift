import Foundation

final class ListProgramContentService: ListProgramContentAPIServiceProtocol {
    func fetch(with viewModel: ClassroomForProgramContentViewModel, completion: @escaping (Result<ListProgramContentModel, Error>) -> Void) {
        let baseUrl = "http://escola.computex.com.br:86/escola910/json_visualiza_conteudo_programatico.php"
        guard let url = URL(string: baseUrl) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"

        let body = "matricula=\("1091")&senha=\("11111111")&escola=\(viewModel.schoolClass)&ano=\("20231")&grauSerie=\(viewModel.gradeLevel)&turma=\(viewModel.schoolClass)&turno=\(viewModel.classPeriod)&etapa=\("2")&codDisciplina=\(viewModel.disciplineCode)"

        let finalBody = body.data(using: .utf8)
        request.httpBody = finalBody

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ListProgramContentModel.self, from: data)
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
