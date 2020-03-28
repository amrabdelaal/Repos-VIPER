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
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createReposListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ReposNavigationController")
        if let view = mainStoryboard.instantiateViewController(withIdentifier: "ReposListViewController") as? ReposListViewController {
            let presenter: ReposListPresenterProtocol & ReposListInteractorOutputProtocol = ReposListPresenter()
            let interactor: ReposListInteractorInputProtocol = ReposListInteractor(dataService: DataService())
            let router: ReposListRouterProtocol = ReposListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
//            interactor.localDatamanager = localDataManager
//            interactor.remoteDatamanager = remoteDataManager
//            remoteDataManager.remoteRequestHandler = interactor
            
            return view
        }
        return UIViewController()
    }
}
