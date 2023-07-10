import Foundation

@testable import gestor_escolar

extension APIResponseAuth {
    static func stub(
        config: Config = .stub(),
        menu: [Menu] = [.stub(), .stub()],
        registration: String = "123456",
        schoolCode: Int =  123,
        year: String =  "2023",
        name: String =  "John Doe",
        school: String =  "School",
        logo: String =  "logo") -> APIResponseAuth {
            return APIResponseAuth(config: config,
                                   menu: menu,
                                   registration: registration,
                                   schoolCode: schoolCode,
                                   year: year,
                                   name: name,
                                   school: school,
                                   logo: logo)
        }
}

extension Config {
    static func stub(date: String = "12/12/2012") -> Config {
        return Config(date: date)
    }
}

extension Menu {
    static func stub(title: String = "Teste",
                     icon: String = "icons8-lista-de-verificação-ios-16") -> Menu {
        return Menu(title: title, icon: icon)
    }
}
