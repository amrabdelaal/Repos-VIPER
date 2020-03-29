//
//  ReposListViewController.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit

class ReposListViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables
    var presenter: ReposListPresenterProtocol?
    var repos: [Repo] = [Repo]()
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ReposListRouter.createReposListModule(reposListRef: self)
        self.presenter?.getRepos()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
    }
}

extension ReposListViewController: ReposListViewProtocol {
    func showRepos(with repos: [Repo]) {
        self.repos = repos
        self.tableView.reloadData()
    }
    
    func showError() {
        
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

}

extension ReposListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.tableView.reloadData()
    }
}
