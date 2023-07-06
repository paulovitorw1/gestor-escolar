import Foundation

@testable import gestor_escolar

extension HomeViewModel {
    static func stub(config: HomeConfigViewModel = .stub(),
                     menus: [HomeMenuViewModel] = [.stub(),
                                                   .stub()]) -> HomeViewModel {
        return HomeViewModel(config: config,
                             menus: menus)
    }
}
