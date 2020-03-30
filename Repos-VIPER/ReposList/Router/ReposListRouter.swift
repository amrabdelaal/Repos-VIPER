//
//  ReposListRouter.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

class ReposListRouter: ReposListRouterProtocol {
    
    static func createReposListModule(reposListRef: ReposListViewController) {
        
        let presenter: ReposListPresenterProtocol & ReposListInteractorOutputProtocol = ReposListPresenter()
        reposListRef.presenter = presenter
        reposListRef.presenter?.router = ReposListRouter()
        reposListRef.presenter?.view = reposListRef
        reposListRef.presenter?.interactor = ReposListInteractor(dataService: DataService())
        reposListRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func pushToRepoDetails(with repo: Repo, from view: UIViewController) {
        if let repoDetailsViewController = view.storyboard?.instantiateViewController(withIdentifier: "RepoDetailsViewController") as? RepoDetailsViewController {
            RepoDetailsRouter.createRepoDetailsModule(with: repoDetailsViewController, and: repo)
            view.navigationController?.pushViewController(repoDetailsViewController, animated: true)
        }
    }
}
