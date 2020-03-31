//
//  ReposListViewController.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
import PKHUD

class ReposListViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables
    var presenter: ReposListPresenterProtocol?
    var repos: [Repo] = [Repo]()
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: RepoTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier: RepoTableViewCell.Identifier)
        ReposListRouter.createReposListModule(reposListRef: self)
        if let searchText = self.searchBar.text {
            self.presenter?.getRepos(with: searchText)
        }
    }
}

extension ReposListViewController: ReposListViewProtocol {
    
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

extension ReposListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: RepoTableViewCell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.Identifier, for: indexPath) as? RepoTableViewCell {
            cell.configure(with: self.repos[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = self.repos[indexPath.row]
        if repo.forks > 0 {
            presenter?.showRepoDetails(with: self.repos[indexPath.row], from: self)
        }
    }

}

extension ReposListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchBar = searchBar.text {
            self.presenter?.getRepos(with: searchBar)
        }
    }
}
