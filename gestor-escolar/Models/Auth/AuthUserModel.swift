import Foundation

struct APIResponseAuth: Codable {
    let config: Config
    let menu: [Menu]
    let registration: String
    let schoolCode: Int
    let year: String
    let name: String
    let school: String
    let logo: String

    private enum CodingKeys: String, CodingKey {
        case config, menu
        case registration = "matricula"
        case schoolCode = "codigo_escola"
        case year = "ano"
        case name = "nome"
        case school = "escola"
        case logo = "logo_escola"
    }
}

struct Config: Codable {
    let date: String

    private enum CodingKeys: String, CodingKey {
        case date = "data"
    }
}

struct Menu: Codable {
    let title: String
    let icon: String

    private enum CodingKeys: String, CodingKey {
        case title = "titulo"
        case icon = "icone"
    }
}
