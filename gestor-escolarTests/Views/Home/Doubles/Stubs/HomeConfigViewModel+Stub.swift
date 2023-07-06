import Foundation

@testable import gestor_escolar

extension HomeConfigViewModel {
    static func stub(date: String = "16/10/2020",
                     nameUser: String = "Paulo Vitor",
                     logo: String = "imagenslogotipo.png",
                     nameScholl: String = "name school",
                     registration: String = "registration",
                     schoolCode: Int = 1,
                     year: String = "20231") -> HomeConfigViewModel {
        return HomeConfigViewModel(date: date,
                                   nameUser: nameUser,
                                   logo: logo,
                                   nameScholl: nameScholl,
                                   registration: registration,
                                   schoolCode: schoolCode,
                                   year: year)
    }
}
