//
//  UserReposListViewController.swift
//  Repos-VIPER
//
//  Created by Amr on 31.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
import PKHUD

class UserReposListViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables
    var presenter: UserReposListPresenterProtocol?
    var parentRepo: Repo?
    var repos: [Repo] = [Repo]()
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    func updateUI() {
        if let repo = parentRepo {
            self.presenter?.getRepos(with: repo.owner?.reposUrl ?? "")
        }
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: UserRepoTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier: UserRepoTableViewCell.Identifier)
    }

    //MARK:- IBActions
    @IBAction func backAction(_ sender: Any) {
        presenter?.backToRepoDetails(from: self)
    }
}

extension UserReposListViewController: UserReposListViewProtocol {
    
    func showRepos(with repos: [Repo]) {
        self.repos = repos
        self.tableView.reloadData()
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func showError() {
        HUD.flash(.label("Problem Happened"), delay: 2.0)
    }
    
}

extension UserReposListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: UserRepoTableViewCell = tableView.dequeueReusableCell(withIdentifier: UserRepoTableViewCell.Identifier, for: indexPath) as? UserRepoTableViewCell {
            cell.configure(with: self.repos[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

}
