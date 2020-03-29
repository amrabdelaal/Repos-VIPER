//
//  ReposListPresenter.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation

class ReposListPresenter: ReposListPresenterProtocol {
    func getRepos(with language: String) {
        view?.showLoading()
        interactor?.retrieveRepos(with: language)
    }
    
    weak var view: ReposListViewProtocol?
    var interactor: ReposListInteractorInputProtocol?
    var router: ReposListRouterProtocol?

}

extension ReposListPresenter: ReposListInteractorOutputProtocol {
    func didRetrieveRepos(_ repos: [Repo]) {
        view?.hideLoading()
        view?.showRepos(with: repos)
    }
    
    func onError() {
        view?.showError()
    }
    
}
