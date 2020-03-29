//
//  RepoTableViewCell.swift
//  Repos-VIPER
//
//  Created by Amr on 29.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
import AlamofireImage

class RepoTableViewCell: UITableViewCell {

    static let Identifier = "RepoTableViewCell"
    
    // MARK:- IBOutlets
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var forksNum: UILabel!
    @IBOutlet weak var watchersNum: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with repo: Repo) {
        if let url = URL(string: repo.owner.avatarUrl) {
            self.avatar.af.setImage(withURL: url)
            self.repoName.text = repo.name
            self.forksNum.text = "forks: \(repo.forks)"
            self.watchersNum.text = "watchers: \(repo.watchers)"
            self.repoDescription.text = repo.description
        }
    }

}
