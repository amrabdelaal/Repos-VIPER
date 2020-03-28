//
//  ReposListViewController.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit

class ReposListViewController: UIViewController {

    var presenter: ReposListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getRepos()
    }
}

extension ReposListViewController: ReposListViewProtocol {
    func showRepos(with repos: [Repo]) {
        debugPrint(repos)
    }
    
    func showError() {
        
    }
    
    
}
