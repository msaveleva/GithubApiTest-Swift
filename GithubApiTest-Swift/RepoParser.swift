//
//  RepoParser.swift
//  GithubApiTest-Swift
//
//  Created by MariaSaveleva on 24/02/2017.
//  Copyright © 2017 MariaSaveleva. All rights reserved.
//

import Foundation

class RepoParser {

    public func parseObject(object: Any) -> Repo? {
        var owner = ""
        var title = ""
        var descriptionMessage: String?

        if let dictionary = object as? [String : Any] {
            if let repoOwner = dictionary["owner"] as? [String : Any] {
                if let repoLogin = repoOwner["login"] as? String {
                    owner = repoLogin
                }
            }

            if let repoTitle = dictionary["name"] as? String {
                title = repoTitle
            }

            if let repoDescription = dictionary["description"] as? String {
                descriptionMessage = repoDescription
            }
        }

        return Repo(owner: owner, title: title, descriptionMessage: descriptionMessage)
    }

}
