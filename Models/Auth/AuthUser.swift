import Foundation

struct APIResponseAuth: Codable {
    let config: Config
    let menu: [Menu]
    let name: String
    let school: String
    let logo: String

    private enum CodingKeys: String, CodingKey {
        case config, menu
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
