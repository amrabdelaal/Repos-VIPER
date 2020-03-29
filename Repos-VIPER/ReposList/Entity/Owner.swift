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
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}
