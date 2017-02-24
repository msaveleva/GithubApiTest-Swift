//
//  ReposRequest.swift
//  GithubApiTest-Swift
//
//  Created by MariaSaveleva on 24/02/2017.
//  Copyright © 2017 MariaSaveleva. All rights reserved.
//

import Foundation

class ReposRequest {

    class func createWithUserName(name: String) -> URLRequest? {
        let urlString = "https://api.github.com/users/\(name)/repos"
        let url = URL(string: urlString)

        guard let urlForRequest = url else { return nil }

        return URLRequest(url: urlForRequest)
    }

}
