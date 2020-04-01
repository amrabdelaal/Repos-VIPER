//
//  ReposListPresenterTests.swift
//  Repos-VIPERTests
//
//  Created by Amr on 31.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import XCTest
@testable import Repos_VIPER

class ReposListPresenterTests: XCTestCase {

    var presenter: ReposListPresenter?
    var mockView: MockReposListView?
    var mockInteractor: MockReposListInteractor?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = ReposListPresenter()
        mockView = MockReposListView()
        mockInteractor = MockReposListInteractor()
        presenter?.view = mockView
        presenter?.interactor = mockInteractor
        mockInteractor?.presenter = presenter
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        presenter = nil
        mockView = nil
        mockInteractor = nil
    }
    
    func testLoadingWhileRetrieveData() throws {
        presenter?.getRepos(with: "swift")
        XCTAssertTrue(mockView?.isLoading == true)
    }
    
    func testLoadingHideAfterGetData() throws {
        presenter?.getRepos(with: "swift")
        XCTAssertTrue(mockView?.finishLoading == true)
    }
    
    func testReposCountWithRightSearchWord() throws {
        presenter?.getRepos(with: "swift")
        XCTAssertTrue((mockView?.mockRepos.count)! > 0)
    }
    
    func testReposFirstElementNameNotEmpty() throws {
        presenter?.getRepos(with: "swift")
        XCTAssertNotEqual(mockView?.mockRepos.first?.name, "")
    }
    
    func testReposFirstElementNameNotNil() throws {
        presenter?.getRepos(with: "swift")
        XCTAssertNotNil(mockView?.mockRepos.first?.name)
    }

}

class MockReposListView: ReposListViewProtocol {
    var presenter: ReposListPresenterProtocol?
    var mockRepos: [Repo] = [Repo]()
    var error: Error?
    var isLoading: Bool = false
    var finishLoading: Bool = false
    
    func showRepos(with repos: [Repo]) {
        self.mockRepos = repos
    }
    
    func showError() {
        error = Utilities.GenericError.connectionFaild
    }
    
    func showLoading() {
        isLoading = true
    }
    
    func hideLoading() {
        finishLoading = true
    }
}

class MockReposListInteractor: ReposListInteractorInputProtocol {
    var presenter: ReposListInteractorOutputProtocol?
    
    func retrieveRepos(with language: String) {
        MockDataService().getRepos(by: language, success: { (repos) in
            self.presenter?.didRetrieveRepos(repos ?? [Repo]())
        }) { (error) in
            self.presenter?.onError()
        }
    }

}

class MockReposListRouter: ReposListRouterProtocol {
    static func createReposListModule(reposListRef: ReposListViewController) {
    }
    
    func pushToRepoDetails(with repo: Repo, from view: UIViewController) {
        
    }
}
