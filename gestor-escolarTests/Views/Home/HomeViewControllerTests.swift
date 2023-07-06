import Quick
import Nimble

@testable import gestor_escolar

final class HomeViewControllerTests: QuickSpec {
    override func spec() {

        var sut: HomeViewController!
        var presenterMock: HomePresenterSpy!
        var viewSpy: HomeViewSpy!
        var delegateSpy: HomeViewControllerDelegateSpy!

        beforeEach {
            presenterMock = HomePresenterSpy()
            viewSpy = HomeViewSpy()
            delegateSpy = HomeViewControllerDelegateSpy()
            sut = HomeViewController(contentView: viewSpy,
                                     presenter: presenterMock)
            sut.delegate = delegateSpy
        }

        describe("#viewDidLoad") {
            context("when calling #viewDidLoad()") {
                it("should instantiate the view of type HomeView") {
                    expect(sut.view).to(beAKindOf(HomeViewProtocol.self))
                }
            }

            context("when calling #fetchData()") {
                beforeEach {
                    presenterMock.fetchData()
                }
                
                it("should call the presenter's fetchData method on viewDidLoad") {
                    expect(presenterMock.fetchDataCalledCount) == 1
                }
                
                it("should call the presenter's show method when receiving viewModel") {
                    expect(presenterMock.receivedViewModel) == .stub()
                }
            }
        }

        describe("#show(_ viewModel: HomeViewModel)") {
            context("when calling #show(_ viewModel: HomeViewModel)") {
                beforeEach {
                    sut.show(.stub())
                }

                it("should call the view show method") {
                    expect(viewSpy.showCount) == 1
                }

                it("should call the presenter's show method when receiving viewModel") {
                    expect(viewSpy.receivedViewModel) == .stub()
                }
            }
        }

        describe("#HomeViewControllerDelegate") {
            context("when calling #didTappedMenu: ((HomeConfigViewModel?) -> Void)?") {
                beforeEach {
                    viewSpy.didTappedMenu = { _ in
                        delegateSpy.didToClassrooms(with: .stub())
                    }

                    viewSpy.didTappedMenu?(.stub())
                }

                it("should call the view show method") {
                    expect(delegateSpy.didToClassroomsCount) == 1
                }

                it("should call the presenter's show method when receiving viewModel") {
                    expect(delegateSpy.receivedViewModel) == .stub()
                }
            }
        }
    }
}
