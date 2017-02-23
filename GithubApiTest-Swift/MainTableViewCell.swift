//
//  MainTableViewCell.swift
//  GithubApiTest-Swift
//
//  Created by MariaSaveleva on 23/02/2017.
//  Copyright © 2017 MariaSaveleva. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet private var repoNameLabel: UILabel!
    @IBOutlet private var repoDescriptionLabel: UILabel!

    func configureCell(repoName: String, repoDescription: String) {
        repoNameLabel.text = repoName
        repoDescriptionLabel.text = repoDescription
    }
    
}
