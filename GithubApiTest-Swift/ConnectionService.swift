//
//  ConnectionService.swift
//  GithubApiTest-Swift
//
//  Created by MariaSaveleva on 24/02/2017.
//  Copyright © 2017 MariaSaveleva. All rights reserved.
//

import Foundation

class ConnectionService {

    public func fetchData(request: URLRequest, completion: @escaping (_ result: Array<Any>?, _ error: Error?) -> Void) {
        let sharedSession = URLSession.shared
        let sessionTask = sharedSession.dataTask(with: request) { (data, response, loadingError) in
            var resultArray: Array<Any>?

            if let loadingData = data {
                let json = try? JSONSerialization.jsonObject(with: loadingData, options: [])
                if let dictionary = json as? [String : Any] {
                    resultArray = [dictionary]
                } else if let array = json as? [Any] {
                    resultArray = array
                }
            }

            completion(resultArray, loadingError)
        }

        sessionTask.resume()
    }

}
