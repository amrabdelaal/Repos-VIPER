//
//  RepoDetailsInteractor.swift
//  Repos-VIPER
//
//  Created by Amr on 30.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import Alamofire

class RepoDetailsInteractor: RepoDetailsInteractorInputProtocol {
    
    // MARK: - Variables
    private var dataService: DataService?
    weak var presenter: RepoDetailsInteractorOutputProtocol?
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    
    func retrieveForks(with url: String) {
        self.dataService?.getRepoData(by: url, success: { [weak self] (repos) in
            if let repos = repos {
                self?.presenter?.didRetrieveForks(repos)
            } else {
                self?.presenter?.onError()
            }
        }, failure: { (error) in
            self.presenter?.onError()
        })
    }
    
}
