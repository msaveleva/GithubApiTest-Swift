//
//  ViewController.swift
//  GithubApiTest-Swift
//
//  Created by MariaSaveleva on 23/02/2017.
//  Copyright © 2017 MariaSaveleva. All rights reserved.
//

import UIKit

let kMainCellIdentifier = "MainCellIdentifier"

class ViewController: UIViewController {

    @IBOutlet fileprivate var tableView: UITableView!

    fileprivate var repos = [Repo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        test()
    }

    func test() {
        DataManager.sharedInstance.fetchReposFor(userName: "msaveleva") { [weak self] (result) in
            self?.repos = result
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    @IBAction func reloadContent(_ sender: Any) {
    }
    
    @IBAction func addNewUser(_ sender: Any) {
    }
}


extension ViewController {

    fileprivate func configureUI() {
        let cellNib = UINib(nibName: String(describing: MainTableViewCell.self), bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: kMainCellIdentifier)

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150.0
    }

}


extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kMainCellIdentifier) as? MainTableViewCell

        guard let tableViewCell = cell else {
            return UITableViewCell()
        }

        if repos.count - 1 >= indexPath.row {
            let repo = repos[indexPath.row]
            cell?.configureCell(repoName: repo.title, repoDescription: repo.descriptionMessage)
        }

        return tableViewCell;
    }

}

