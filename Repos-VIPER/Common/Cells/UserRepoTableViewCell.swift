//
//  UserRepoTableViewCell.swift
//  Repos-VIPER
//
//  Created by Amr on 31.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit

class UserRepoTableViewCell: UITableViewCell {

    static let Identifier = "UserRepoTableViewCell"
    
    // MARK:- IBOutlets
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDecription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.selectionStyle = .none
    }
    
    func configure(with repo: Repo) {
        self.repoName.text = repo.fullName
        self.repoDecription.text = repo.description
    }
    
}
