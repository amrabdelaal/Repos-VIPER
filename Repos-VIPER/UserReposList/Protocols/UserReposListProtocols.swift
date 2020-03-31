//
//  UserReposListProtocols.swift
//  Repos-VIPER
//
//  Created by Amr on 31.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

// MARK:- View - Presenter
protocol UserReposListPresenterProtocol: class {
    var view: UserReposListViewProtocol? { get set }
    var interactor: UserReposListInteractorInputProtocol? { get set }
    var router: UserReposListRouterProtocol? { get set }

    func getRepos(with url: String)
    func backToRepoDetails(from view: UIViewController)
}

// MARK:- Presenter - View
protocol UserReposListViewProtocol: class {
    var presenter: UserReposListPresenterProtocol? { get set }
    
    func showRepos(with repos: [Repo])
    func showError()
    func showLoading()
    func hideLoading()
}

// MARK:- Presenter - Interactor
protocol UserReposListInteractorInputProtocol: class {
    var presenter: UserReposListInteractorOutputProtocol? { get set }
    
    func retrieveRepos(with url: String)
}

// MARK:- Interactor - Presenter
protocol UserReposListInteractorOutputProtocol: class {
    func didRetrieveRepos(_ repos: [Repo])
    func onError()
}

// MARK:- Presenter - Router
protocol UserReposListRouterProtocol: class {
    static func createUserReposListModule(userReposListRef: UserReposListViewController, and repo: Repo)
    func backToRepoDetails(from view: UIViewController)
}
