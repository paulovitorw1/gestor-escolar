import UIKit

struct HomeViewModel: Equatable {
    let config: HomeConfigViewModel
    let menus: [HomeMenuViewModel]
}

struct HomeMenuViewModel: Equatable {
    let title: String
    let icon: String
}

struct HomeConfigViewModel: Equatable {
    let date: String
    let nameUser: String
    let logo: String
    let nameScholl: String
    let registration: String
    let schoolCode: Int
    let year: String
}
