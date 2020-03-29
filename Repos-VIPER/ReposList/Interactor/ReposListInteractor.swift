//
//  ReposListInteractor.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import Alamofire

class ReposListInteractor: ReposListInteractorInputProtocol {
    
    // MARK: - Variables
    private var dataService: DataService?
    weak var presenter: ReposListInteractorOutputProtocol?
    
    init(dataService: DataService) {
        self.dataService = dataService
    }

    func retrieveRepos() {
        self.dataService?.getRepos(by: "swift", success: { [weak self] (repos) in
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
