//
//  ReposListProtocols.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

// MARK:- View - Presenter
protocol ReposListPresenterProtocol: class {
    var view: ReposListViewProtocol? { get set }
    var interactor: ReposListInteractorInputProtocol? { get set }
    var router: ReposListRouterProtocol? { get set }
    
    func getRepos(with language: String)
    func showRepoDetails(with repo: Repo, from view: UIViewController)
}

// MARK:- Presenter - View
protocol ReposListViewProtocol: class {
    var presenter: ReposListPresenterProtocol? { get set }
    
    func showRepos(with repos: [Repo])
    func showError()
    func showLoading()
    func hideLoading()
}

// MARK:- Presenter - Interactor
protocol ReposListInteractorInputProtocol: class {
    var presenter: ReposListInteractorOutputProtocol? { get set }
    
    func retrieveRepos(with language: String)
}

// MARK:- Interactor - Presenter
protocol ReposListInteractorOutputProtocol: class {
    func didRetrieveRepos(_ repos: [Repo])
    func onError()
}

// MARK:- Presenter - Router
protocol ReposListRouterProtocol: class {
    static func createReposListModule(reposListRef: ReposListViewController)
    func pushToRepoDetails(with repo: Repo,from view: UIViewController)
}
