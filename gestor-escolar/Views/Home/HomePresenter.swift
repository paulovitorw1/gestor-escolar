import Foundation

final class HomePresenter: HomePresenterProtocol {
    weak var controller: HomeViewControllerProtocol?
    let apiService = APIService()

    func fetchData() {
        apiService.show { [weak self] response in
            DispatchQueue.main.async {
                guard let response = response else { return }
                let homeMenuViewModels = response.menu.map {
                    HomeMenuViewModel(title: $0.title, icon: $0.icon)
                }
                let configViewModel = HomeConfigViewModel(date: response.config.date,
                                                          nameUser: response.name,
                                                          logo: response.logo,
                                                          nameScholl: response.school,
                                                          registration: response.registration,
                                                          schoolCode: response.schoolCode,
                                                          year: response.year)
                let viewModel = HomeViewModel(config: configViewModel,
                                              menus: homeMenuViewModels)
                self?.controller?.show(viewModel)
            }
        }
    }
}
