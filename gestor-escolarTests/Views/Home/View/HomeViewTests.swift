import Quick
import Nimble

@testable import gestor_escolar

final class HomeViewTests: QuickSpec {
    override func spec() {
        var sut: HomeViewProtocol!
        var viewModel: HomeViewModel!

        beforeEach {
            sut = HomeView()
            viewModel = .stub()
        }

        describe("#show(_ viewModel: HomeViewModel)") {
            context("when calling #show(_ viewModel: HomeViewModel)") {
                beforeEach {
                    sut.show(.stub())
                }

                it("should return the correct data") {
                    expect(viewModel) == .stub()
                }
            }
        }
        
        describe("#didTappedMenu: ((HomeConfigViewModel?)") {
            context("when calling #didTappedMenu: ((HomeConfigViewModel?)") {
                var capturedViewModel: HomeConfigViewModel?
                var didTappedMenuCount: Int = 0

                beforeEach {
                    sut.didTappedMenu = { viewModel in
                        capturedViewModel = .stub()
                        didTappedMenuCount += 1
                    }

                    sut.didTappedMenu?(.stub())
                }

                it("should return the correct data") {
                    expect(capturedViewModel) == .stub()
                }

                it("should return os the increment didTappedMenuCount") {
                    expect(didTappedMenuCount) == 1
                }
            }
        }

        describe("#show(_ viewModel: HomeViewModel)") {
            context("when calling #show(_ viewModel: HomeViewModel)") {
                beforeEach {
                    sut.show(.stub())
                }

                it("should return the correct data") {
                    expect(viewModel) == .stub()
                }
            }
        }
    }
}
