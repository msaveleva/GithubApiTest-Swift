//
//  Repo.swift
//  GithubApiTest-Swift
//
//  Created by MariaSaveleva on 24/02/2017.
//  Copyright © 2017 MariaSaveleva. All rights reserved.
//

import Foundation

class Repo: NSObject {

    public private(set) var owner: String
    public private(set) var title: String
    public private(set) var descriptionMessage: String?

    init?(owner: String, title: String, descriptionMessage: String?) {
        if owner == "" && title == "" {
            return nil
        } else {
            self.owner = owner
            self.title = title
            self.descriptionMessage = descriptionMessage

            super.init()
        }
    }

}
