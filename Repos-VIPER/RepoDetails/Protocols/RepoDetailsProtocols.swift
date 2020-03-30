//
//  RepoDetailsProtocols.swift
//  Repos-VIPER
//
//  Created by Amr on 30.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

// MARK:- View - Presenter
protocol RepoDetailsPresenterProtocol: class {
    var view: RepoDetailsViewProtocol? { get set }
    var interactor: RepoDetailsInteractorInputProtocol? { get set }
    var router: RepoDetailsRouterProtocol? { get set }
    
    func getForks(with language: String)
    func backToReposList(from view: UIViewController)
//    func showRepoDetails(with repo: Repo, from view: UIViewController)
}

// MARK:- Presenter - View
protocol RepoDetailsViewProtocol: class {
    var presenter: RepoDetailsPresenterProtocol? { get set }
    
    func showForks(with forks: [Repo])
    func showError()
    func showLoading()
    func hideLoading()
}

// MARK:- Presenter - Interactor
protocol RepoDetailsInteractorInputProtocol: class {
    var presenter: RepoDetailsInteractorOutputProtocol? { get set }
    
    func retrieveForks(with url: String)
}

// MARK:- Interactor - Presenter
protocol RepoDetailsInteractorOutputProtocol: class {
    func didRetrieveForks(_ repos: [Repo])
    func onError()
}

// MARK:- Presenter - Router
protocol RepoDetailsRouterProtocol: class {
    static func createRepoDetailsModule(with repoDetailsRef: RepoDetailsViewController, and repo: Repo)
    func backToReposList(from view: UIViewController)
//    func pushToRepoDetails(with repo: Repo,from view: UIViewController)
}
