//
//  DataService.swift
//  Repos-VIPER
//
//  Created by Amr on 28.03.20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import Alamofire

class DataService {
    // MARK:- GET Methods
    func getRepos(by language: String, success: @escaping ([Repo]?) -> (), failure: @escaping (Error?) -> ()) {
        let completeUrl = "\(Utilities.UrlParts.baseUrl.rawValue)\(Utilities.UrlParts.query.rawValue)\(Utilities.UrlParts.language.rawValue)\(language)"
        
        AF.request(completeUrl).responseJSON { response in
            if let error = response.error {
                failure(error)
            }
            
            if let data = response.data {
                do {
                    let repos = try JSONDecoder().decode(ReposItems.self, from: data).items
                    success(repos)
                } catch {
                    failure(Utilities.GenericError.wrongJsonFormat)
                }
            } else {
                failure(Utilities.GenericError.connectionFaild)
            }
        }
    }
    
    func getRepoData(by url: String, success: @escaping ([Repo]?) -> (), failure: @escaping (Error?) -> ()) {
        
        AF.request(url).responseJSON { response in
            if let error = response.error {
                failure(error)
            }
            
            if let data = response.data {
                do {
                    let repos = try JSONDecoder().decode([Repo].self, from: data)
                    success(repos)
                } catch {
                    failure(Utilities.GenericError.wrongJsonFormat)
                }
            } else {
                failure(Utilities.GenericError.connectionFaild)
            }
        }
    }
}
