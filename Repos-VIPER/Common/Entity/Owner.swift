//
//  Owner.swift
//  Repos-VIPER
//
//  Created by Amr on 29.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation

struct Owner: Codable {
    var avatarUrl: String
    var reposUrl: String
    var login: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
        case login = "login"
    }
}
