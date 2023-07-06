import Quick
import Nimble

@testable import gestor_escolar

final class MenuCollectionViewCellTests: QuickSpec {
    override func spec() {
        var sut: MenuCollectionViewCellProtocol!
        var viewModel: HomeMenuViewModel!

        beforeEach {
            sut = MenuCollectionViewCell()
            viewModel = .stub()
        }

        describe("#configure(_ viewModel: HomeMenuViewModel)") {
            context("when calling #configure(_ viewModel: HomeMenuViewModel)") {
                beforeEach {
                    sut.configure(.stub())
                }

                it("should return the correct data") {
                    expect(viewModel) == .stub()
                }
            }
        }
    }
}
