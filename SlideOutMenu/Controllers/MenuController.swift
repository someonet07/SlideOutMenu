//
//  MenuController.swift
//  SlideOutMenu
//
//  Created by Тимур Чеберда on 04/04/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .blue

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Menu Item Row: \(indexPath.row)"
        return cell
    }
}
