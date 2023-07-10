import Foundation

final class HomePresenter: HomePresenterProtocol {
    weak var controller: HomeViewControllerProtocol?
    var apiService: AuthUserProtocol

    init(apiService: AuthUserProtocol) {
        self.apiService = apiService
    }

    func fetchData() {
        apiService.show { [weak self] response in
            switch response {
            case .success(let result):
                let homeMenuViewModels = result.menu.map {
                    HomeMenuViewModel(title: $0.title, icon: $0.icon)
                }
                let configViewModel = HomeConfigViewModel(date: result.config.date,
                                                          nameUser: result.name,
                                                          logo: result.logo,
                                                          nameScholl: result.school,
                                                          registration: result.registration,
                                                          schoolCode: result.schoolCode,
                                                          year: result.year)
                let viewModel = HomeViewModel(config: configViewModel,
                                              menus: homeMenuViewModels)
                self?.controller?.show(viewModel)
            case .failure(let error):
                print(error)
            }
        }
    }
}
