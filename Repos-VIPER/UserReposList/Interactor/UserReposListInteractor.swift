//
//  UserReposListInteractor.swift
//  Repos-VIPER
//
//  Created by Amr on 31.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import Alamofire

class UserReposListInteractor: UserReposListInteractorInputProtocol {
    
    // MARK: - Variables
    private var dataService: DataService?
    weak var presenter: UserReposListInteractorOutputProtocol?
    
    init(dataService: DataService) {
        self.dataService = dataService
    }

    func retrieveRepos(with url: String) {
        self.dataService?.getRepoData(by: url, success: { [weak self] (repos) in
            if let repos = repos {
                self?.presenter?.didRetrieveRepos(repos)
            } else {
                self?.presenter?.onError()
            }
        }, failure: { (error) in
            self.presenter?.onError()
        })
    }
    
}
