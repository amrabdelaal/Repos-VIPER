//
//  ReposListInteractorTests.swift
//  Repos-VIPERTests
//
//  Created by Amr on 31.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import XCTest
@testable import Repos_VIPER

class ReposListInteractorTests: XCTestCase {

    var interactor: ReposListInteractor?
    var presenter: MockReposListInteractorOutput?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = ReposListInteractor(dataService: MockDataService())
        presenter = MockReposListInteractorOutput()
        interactor?.presenter = presenter
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
        presenter = nil
    }
    
    func testInteractorOutputNotEmpty() throws {
        interactor?.retrieveRepos(with: "swift")
        XCTAssertTrue((presenter?.mockRepos.count)! > 0)
    }
    
    func testInteractorOutputCheckFirstSuccess() throws {
        interactor?.retrieveRepos(with: "swift")
        XCTAssertEqual(presenter?.mockRepos.first?.name, "awesome-ios")
    }
    
    func testInteractorOutputCheckFirstItemNotEmpty() throws {
        interactor?.retrieveRepos(with: "swift")
        XCTAssertNotEqual(presenter?.mockRepos.first?.name, "")
    }
    
    func testInteractorOutputCheckFirstItemNotNil() throws {
        interactor?.retrieveRepos(with: "swift")
        XCTAssertNotNil(presenter?.mockRepos.first?.name)
    }
    
    func testInteractorOutputCheckErrorHandling() throws {
        interactor?.retrieveRepos(with: "java")
        XCTAssertEqual(presenter?.error?.localizedDescription, Utilities.GenericError.connectionFaild.localizedDescription)
    }

}

class MockReposListInteractorOutput: ReposListInteractorOutputProtocol {
    
    var mockRepos: [Repo] = [Repo]()
    var error: Error?
    func didRetrieveRepos(_ repos: [Repo]) {
        mockRepos = repos
    }
    
    func onError() {
        error = Utilities.GenericError.connectionFaild
    }

}
