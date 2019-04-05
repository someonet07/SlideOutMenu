//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by Тимур Чеберда on 03/04/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        setupNavigationItems()
        setupMenuController()
        
        // Pan Gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
        
        var x = translation.x
        x = min(menuWidth, x)
        x = max(0, x)
        
        let transform = CGAffineTransform(translationX: translation.x, y: 0)
        
        menuController.view.transform = transform
        navigationController?.view.transform = transform
    }
    
    let menuController = MenuController()
    fileprivate let menuWidth: CGFloat = 300
    
    fileprivate func performAnimations(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuController.view.transform = transform
            self.view.transform = transform
        })
    }
    
    @objc fileprivate func handleOpen() {
        performAnimations(transform: CGAffineTransform(translationX: self.menuWidth, y: 0))
        addChild(menuController)
    }
    
    @objc fileprivate func handleHide() {
        performAnimations(transform: .identity)
    }
    
    
    
    // MARK:- Setup's
    
    fileprivate func setupMenuController() {
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(menuController.view)
    }
    
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
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

