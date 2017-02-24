//
//  DataManager.swift
//  GithubApiTest-Swift
//
//  Created by MariaSaveleva on 24/02/2017.
//  Copyright © 2017 MariaSaveleva. All rights reserved.
//

import Foundation

class DataManager {

    static let sharedInstance = DataManager()

    private let connectionService = ConnectionService()
    private let repoParser = RepoParser()

    public func fetchReposFor(userName: String, completion: @escaping (_ repos: Array<Repo>) -> Void) {
        var result = [Repo]()

        let request = ReposRequest.createWithUserName(name: userName)
        guard let reposRequest = request else {
            completion(result)
            return
        }

        connectionService.fetchData(request: reposRequest) { [weak self] (results, error) in
            if let repoObjects = results {
                for object in repoObjects {
                    let repo = self?.repoParser.parseObject(object: object)
                    if let parsedRepo = repo {
                        result.append(parsedRepo)
                    }
                }
            } else {
                print("Error: \(error?.localizedDescription)")
            }

            completion(result)
        }
    }

}
