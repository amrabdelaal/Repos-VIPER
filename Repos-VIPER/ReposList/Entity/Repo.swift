//
//  Repo.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation

class ReposItems: Codable {
    let items: [Repo]
}

class Repo: Codable {
    let id: Int
    let node_id: String
    let name: String
    let full_name: String
    let html_url: String
    let fork: Bool
    let updated_at: String
}
