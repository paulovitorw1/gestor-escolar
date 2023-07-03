import Foundation

struct ProgramContentResponseModel: Codable {
    let message: String

    private enum CodingKeys: String, CodingKey {
        case message = "Sucesso"
    }
}
