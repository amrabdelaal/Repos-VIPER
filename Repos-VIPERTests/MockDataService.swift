//
//  MockDataService.swift
//  Repos-VIPERTests
//
//  Created by Amr on 31.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
@testable import Repos_VIPER

class MockDataService: DataService {
    override func getRepos(by language: String, success: @escaping ([Repo]?) -> (), failure: @escaping (Error?) -> ()) {
        if language != "swift" {
            failure(Utilities.GenericError.connectionFaild)
        }
        if let path = Bundle(for: type(of: self)).path(forResource: "ReposSearch", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let repos = try JSONDecoder().decode(ReposItems.self, from: data).items
                success(repos)
            } catch {
                failure(Utilities.GenericError.wrongJsonFormat)
            }
        } else {
            failure(Utilities.GenericError.connectionFaild)
        }
    }
}
