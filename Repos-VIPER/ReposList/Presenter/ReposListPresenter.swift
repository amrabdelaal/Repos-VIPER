//
//  ReposListPresenter.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

class ReposListPresenter: ReposListPresenterProtocol {
    
    weak var view: ReposListViewProtocol?
    var interactor: ReposListInteractorInputProtocol?
    var router: ReposListRouterProtocol?
    
    func getRepos(with language: String) {
        view?.showLoading()
        interactor?.retrieveRepos(with: language)
    }
    
    func showRepoDetails(with repo: Repo, from view: UIViewController) {
        router?.pushToRepoDetails(with: repo, from: view)
    }

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
