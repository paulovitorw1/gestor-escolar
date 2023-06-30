import UIKit

struct HomeViewModel {
    let config: HomeConfigViewModel
    let menus: [HomeMenuViewModel]
}

struct HomeMenuViewModel {
    let title: String
    let icon: String
}

struct HomeConfigViewModel {
    let date: String
    let nameUser: String
    let logo: String
    let nameScholl: String
    let registration: String
    let schoolCode: Int
    let year: String
}
