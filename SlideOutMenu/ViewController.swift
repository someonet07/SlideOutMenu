//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by Тимур Чеберда on 03/04/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        setupNavigationItems()
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    @objc fileprivate func handleOpen() {
        
        let vc = MenuController()
        vc.view.backgroundColor = .blue
        vc.view.frame = CGRect(x: 0, y: 0, width: 200, height: self.view.frame.height)
        
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(vc.view)
        
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
//        blueView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        view.addSubview(blueView)
//    }
    }
    
    @objc fileprivate func handleHide() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }


}

