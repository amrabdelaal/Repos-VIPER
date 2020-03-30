//
//  RepoDetailsPresenter.swift
//  Repos-VIPER
//
//  Created by Amr on 30.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

class RepoDetailsPresenter: RepoDetailsPresenterProtocol {
    
    weak var view: RepoDetailsViewProtocol?
    var interactor: RepoDetailsInteractorInputProtocol?
    var router: RepoDetailsRouterProtocol?
    
    func getForks(with url: String) {
        view?.showLoading()
        interactor?.retrieveForks(with: url)
    }
    
    func backToReposList(from view: UIViewController) {
        router?.backToReposList(from: view)
    }

}

extension RepoDetailsPresenter: RepoDetailsInteractorOutputProtocol {
    func didRetrieveForks(_ repos: [Repo]) {
        view?.hideLoading()
        view?.showForks(with: repos)
    }
    
    func onError() {
        view?.showError()
    }
}
