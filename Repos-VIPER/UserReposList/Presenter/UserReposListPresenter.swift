//
//  UserReposListPresenter.swift
//  Repos-VIPER
//
//  Created by Amr on 31.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

class UserReposListPresenter: UserReposListPresenterProtocol {
    
    weak var view: UserReposListViewProtocol?
    var interactor: UserReposListInteractorInputProtocol?
    var router: UserReposListRouterProtocol?
    
    func getRepos(with url: String) {
        view?.showLoading()
        interactor?.retrieveRepos(with: url)
    }
    
    func backToRepoDetails(from view: UIViewController) {
        router?.backToRepoDetails(from: view)
    }

}

extension UserReposListPresenter: UserReposListInteractorOutputProtocol {
    func didRetrieveRepos(_ repos: [Repo]) {
        view?.hideLoading()
        view?.showRepos(with: repos)
    }
    
    func onError() {
        view?.showError()
    }
    
}
