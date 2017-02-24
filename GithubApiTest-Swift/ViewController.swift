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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        test()
    }

    func test() {
        DataManager.sharedInstance.fetchReposFor(userName: "msaveleva") { (result) in

        }
    }

    @IBAction func reloadContent(_ sender: Any) {
    }
    
    @IBAction func addNewUser(_ sender: Any) {
    }
}


extension ViewController {

    fileprivate func configureUI() {
        let cellNib = UINib(nibName: "MainTableViewCell", bundle: Bundle.main) //TODO: change string
        tableView.register(cellNib, forCellReuseIdentifier: kMainCellIdentifier)

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150.0
    }

}


extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1; //TODO: change
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kMainCellIdentifier)

        //TODO: configure cell

        guard let tableViewCell = cell else {
            return UITableViewCell()
        }

        return tableViewCell;
    }

}

