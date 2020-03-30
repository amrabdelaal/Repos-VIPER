//
//  Repo.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation

struct ReposItems: Codable {
    let items: [Repo]
}

struct Repo: Codable {
    var id: Int
    var nodeId: String
    var name: String
    var fullName: String
    var htmlUrl: String
    var fork: Bool
    var forks: Int
    var forksUrl: String
    var watchers: Int
    var updatedAt: String
    var description: String
    var owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeId = "node_id"
        case name = "name"
        case fullName = "full_name"
        case htmlUrl = "html_url"
        case fork = "fork"
        case forks = "forks"
        case forksUrl = "forks_url"
        case watchers = "watchers"
        case updatedAt = "updated_at"
        case description = "description"
        case owner = "owner"
    }
}
