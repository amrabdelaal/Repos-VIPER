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
    
//    static var mainStoryboard: UIStoryboard {
//        return UIStoryboard(name: "Main", bundle: Bundle.main)
//    }
    
    static func createReposListModule(reposListRef: ReposListViewController) {
        
        let presenter: ReposListPresenterProtocol & ReposListInteractorOutputProtocol = ReposListPresenter()
        reposListRef.presenter = presenter
        reposListRef.presenter?.router = ReposListRouter()
        reposListRef.presenter?.view = reposListRef
        reposListRef.presenter?.interactor = ReposListInteractor(dataService: DataService())
        reposListRef.presenter?.interactor?.presenter = presenter
        
        
//        if let navController = mainStoryboard.instantiateViewController(withIdentifier: "ReposNavigationController") as? UINavigationController {
//            if let view = navController.viewControllers.first as? ReposListViewController{
//                let presenter: ReposListPresenterProtocol & ReposListInteractorOutputProtocol = ReposListPresenter()
//                let interactor: ReposListInteractorInputProtocol = ReposListInteractor(dataService: DataService())
//                let router: ReposListRouterProtocol = ReposListRouter()
//
//                view.presenter = presenter
//                presenter.view = view
//                presenter.router = router
//                presenter.interactor = interactor
//                interactor.presenter = presenter
//
//                return view
//            }
//
//        }
        
        
    }
}
