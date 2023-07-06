import Quick
import Nimble

@testable import gestor_escolar

final class HomeHeaderViewTests: QuickSpec {
    override func spec() {
        var sut: HomeHeaderViewProtocol!
        var viewModel: HomeConfigViewModel!

        beforeEach {
            sut = HomeHeaderView()
            viewModel = .stub()
        }

        describe("#didTappedMenu: ((HomeConfigViewModel?)") {
            context("when calling didTappedMenu: ((HomeConfigViewModel?)") {
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
