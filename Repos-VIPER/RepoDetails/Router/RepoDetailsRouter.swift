//
//  RepoDetailsRouter.swift
//  Repos-VIPER
//
//  Created by Amr on 30.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

class RepoDetailsRouter: RepoDetailsRouterProtocol {
    
    class func createRepoDetailsModule(with repoDetailsRef: RepoDetailsViewController, and repo: Repo) {
        let presenter: RepoDetailsPresenterProtocol & RepoDetailsInteractorOutputProtocol = RepoDetailsPresenter()
        repoDetailsRef.repo = repo
        repoDetailsRef.presenter = presenter
        repoDetailsRef.presenter?.view = repoDetailsRef
        repoDetailsRef.presenter?.router = RepoDetailsRouter()
        repoDetailsRef.presenter?.interactor = RepoDetailsInteractor(dataService: DataService())
        repoDetailsRef.presenter?.interactor?.presenter = presenter
    }
    
    func backToReposList(from view: UIViewController) {
        view.navigationController?.popViewController(animated: true)
    }
    
    
}
