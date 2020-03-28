//
//  ReposListPresenter.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation

class ReposListPresenter: ReposListPresenterProtocol {
    weak var view: ReposListViewProtocol?
    var interactor: ReposListInteractorInputProtocol?
    var router: ReposListRouterProtocol?
    
    
    func getRepos() {
        // TODO: Add Loading
        interactor?.retrieveRepos()
    }
}

extension ReposListPresenter: ReposListInteractorOutputProtocol {
    func didRetrieveRepos(_ repos: [Repo]) {
        // TODO: Remove Loading
        view?.showRepos(with: repos)
    }
    
    func onError() {
        // TODO: Handel Error
    }
    
}
