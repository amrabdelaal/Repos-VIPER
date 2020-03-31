//
//  UserReposListRouter.swift
//  Repos-VIPER
//
//  Created by Amr on 31.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

class UserReposListRouter: UserReposListRouterProtocol {
    
    static func createUserReposListModule(userReposListRef: UserReposListViewController, and repo: Repo) {
        
        let presenter: UserReposListPresenterProtocol & UserReposListInteractorOutputProtocol = UserReposListPresenter()
        userReposListRef.parentRepo = repo
        userReposListRef.presenter = presenter
        userReposListRef.presenter?.router = UserReposListRouter()
        userReposListRef.presenter?.view = userReposListRef
        userReposListRef.presenter?.interactor = UserReposListInteractor(dataService: DataService())
        userReposListRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func backToRepoDetails(from view: UIViewController) {
        view.navigationController?.popViewController(animated: true)
    }

}
