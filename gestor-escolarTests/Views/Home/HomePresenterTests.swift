import Quick
import Nimble

@testable import gestor_escolar

final class HomePresenterTests: QuickSpec {
    override func spec() {

        var sut: HomePresenter!
        var controllerSpy: HomeViewControllerSpy!
        var apiServiceMock: MockAuthUserService!

        beforeEach {
            apiServiceMock = MockAuthUserService()
            sut = HomePresenter(apiService: apiServiceMock)
            controllerSpy = HomeViewControllerSpy()
            sut.controller = controllerSpy
        }

        describe("#fetchData()") {
            context("when the response is successful") {
                beforeEach {
                    let mockResponse: APIResponseAuth = .stub()
                    apiServiceMock.mockResponse = .success(mockResponse)
                    sut.fetchData()
                }

                it("should call show on the controller") {
                    expect(controllerSpy.showCount).toEventually(equal(1))
                }

                it("should pass the correct viewModel to the controller") {
                    expect(controllerSpy.receivedViewModel?.config).toEventually(equal(.stub(date: "12/12/2012",
                                                                                             nameUser: "John Doe",
                                                                                             logo: "logo",
                                                                                             nameScholl: "School",
                                                                                             registration: "123456",
                                                                                             schoolCode: 123,
                                                                                             year: "2023")))
                    expect(controllerSpy.receivedViewModel?.menus).toEventually(equal([.stub(),
                                                                                       .stub()]))
                }
            }

            context("when the response is a failure") {
                beforeEach {
                    let error = MockAuthUserServiceError.noMockResponse
                    apiServiceMock.mockResponse = .failure(error)
                    sut.fetchData()
                }

                it("should not call show on the controller") {
                    expect(controllerSpy.showCount).toEventually(equal(0))
                }

                it("should not pass the viewModel to the controller") {
                    expect(controllerSpy.receivedViewModel).toEventually(beNil())
                }
            }
        }
    }
}
