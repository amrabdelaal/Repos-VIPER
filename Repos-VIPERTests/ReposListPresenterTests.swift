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
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}

class MockReposListView: ReposListViewProtocol {
    var presenter: ReposListPresenterProtocol?
    
    func showRepos(with repos: [Repo]) {
        
    }
    
    func showError() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}

class MockReposListInteractorInput: ReposListInteractorInputProtocol {
    var presenter: ReposListInteractorOutputProtocol?
    
    func retrieveRepos(with language: String) {
        
    }
}

class MockReposListRouter: ReposListRouterProtocol {
    static func createReposListModule(reposListRef: ReposListViewController) {
    }
    
    func pushToRepoDetails(with repo: Repo, from view: UIViewController) {
        
    }
}
