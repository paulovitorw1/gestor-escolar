import Foundation

struct ListProgramContentModel: Codable {
    let answers: [ProgramContentModel]

    private enum CodingKeys: String, CodingKey {
        case answers = "resposta"
    }
}

struct ProgramContentModel: Codable {
    let recnum: String
    let date: String
    let startTime: String
    let endTime: String
    let text: String

    private enum CodingKeys: String, CodingKey {
        case recnum
        case date = "data"
        case startTime = "hora_inicial"
        case endTime = "hora_final"
        case text = "texto"
    }
}
