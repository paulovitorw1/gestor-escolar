import Foundation

@testable import gestor_escolar

extension HomeMenuViewModel {
    static func stub(title: String = "Teste",
                     icon: String = "icons8-lista-de-verificação-ios-16") -> HomeMenuViewModel {
        return HomeMenuViewModel(title: title,
                                 icon: icon)
    }
}
