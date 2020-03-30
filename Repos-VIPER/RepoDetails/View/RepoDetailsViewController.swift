//
//  RepoDetailsViewController.swift
//  Repos-VIPER
//
//  Created by Amr on 30.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
import PKHUD

class RepoDetailsViewController: UIViewController {

    // MARK:- IBOutlets
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoOwnerBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables
    var presenter: RepoDetailsPresenterProtocol?
    var repo: Repo?
    var forks: [Repo] = [Repo]()
    
    // MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    private func updateUI() {
        if let repo = repo {
            self.repoName.text = repo.name
            self.repoOwnerBtn.setTitle(repo.owner.login, for: .normal)
            self.presenter?.getForks(with: repo.forksUrl)
        }
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: RepoTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier: RepoTableViewCell.Identifier)
        
    }
    
    // MARK:- IBActions
    @IBAction func backAction(_ sender: Any) {
        presenter?.backToReposList(from: self)
    }
    
    @IBAction func repoOwnerAction(_ sender: Any) {
    }
}

extension RepoDetailsViewController: RepoDetailsViewProtocol {
    func showForks(with forks: [Repo]) {
        self.forks = forks
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

extension RepoDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: RepoTableViewCell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.Identifier, for: indexPath) as? RepoTableViewCell {
            cell.configure(with: self.forks[indexPath.row], isFork: true)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter?.showRepoDetails(with: self.repos[indexPath.row], from: self)
    }

}
