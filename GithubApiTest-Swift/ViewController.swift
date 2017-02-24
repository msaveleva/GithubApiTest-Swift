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
    fileprivate var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    @IBAction func reloadContent(_ sender: Any) {
        loadReposFor(userName: userName)
    }
    
    @IBAction func addNewUser(_ sender: Any) {
        showUserNameAlert()
    }
}


extension ViewController {

    fileprivate func configureUI() {
        let cellNib = UINib(nibName: String(describing: MainTableViewCell.self), bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: kMainCellIdentifier)

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150.0
    }

    fileprivate func showUserNameAlert() {
        let alert = createNameAlert()
        self.present(alert, animated: true, completion: nil)
    }

    fileprivate func loadReposFor(userName: String?) {
        DataManager.sharedInstance.fetchReposFor(userName: userName, completion: { [weak self] (results) in
            self?.repos = results
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
    }

    private func createNameAlert() -> UIAlertController {
        let alertController = UIAlertController(title: "Enter user name",
                                                message: "Enter user name to display all of this user's repos.",
                                                preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self, weak alertController] (action) in
            let nameTextField = alertController?.textFields?.first
            self?.userName = nameTextField?.text

            self?.loadReposFor(userName: self?.userName)
        }
        alertController.addAction(okAction)

        alertController.addTextField { (textField) in
            textField.placeholder = "User name"
        }

        return alertController
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

