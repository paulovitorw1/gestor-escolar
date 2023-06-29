import Foundation

final class HomePresenter: HomePresenterProtocol {
    weak var controller: HomeViewControllerProtocol?
    let apiService = APIService()

    func fetchData() {
        apiService.fetchDataFromAPI { [weak self] response in
            DispatchQueue.main.async {
                guard let response = response else { return }
                let homeMenuViewModels = response.menu.map {
                    HomeMenuViewModel(title: $0.title, icon: $0.icon)
                }

                let viewModel = HomeViewModel(config: HomeConfigViewModel(date: response.config.date,
                                                                          nameUser: response.name,
                                                                          logo: response.logo,
                                                                          nameScholl: response.school),
                                              menus: homeMenuViewModels)
                self?.controller?.show(viewModel)
            }
        }
    }
}
