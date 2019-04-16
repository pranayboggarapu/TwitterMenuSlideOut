//
//  ViewController.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/7/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var menuView: MenuTableViewController = MenuTableViewController()

    fileprivate let menuWidth: CGFloat = 350
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationItems()
        
        addMenuViewController()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        
        
        if gesture.state == .changed {
            var xPoint = translation.x
            xPoint = min(menuWidth, xPoint)
            print(xPoint)
            xPoint = max(0, xPoint)
            let transformValue = CGAffineTransform(translationX: xPoint, y: 0)
            transform(transformValue)
            
        } else if gesture.state == .ended {
            handleOpen()
        }
        
        

        //transform(CGAffineTransform(translationX: translation.x, y: 0))
        
    }
    
    func transform(_ transformValue: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuView.view.transform = transformValue
            self.navigationController?.view.transform = transformValue
        })
    }
    
    
    @objc func handleOpen() {
        print("Opening Menu...")
        transform(CGAffineTransform(translationX: menuWidth, y: 0))
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
//            self.menuView.view.transform = CGAffineTransform(translationX: self.menuWidth, y: 0)
//        }, completion: nil)
//        let vc = ViewController()
//        vc.view.frame = view.frame
//        vc.view.backgroundColor = .yellow
//        view.addSubview(vc.view)
//
////        let menuView = UIView()
////        menuView.backgroundColor = .yellow
////        menuView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//
//        let menuView = MenuTableViewController()
//        menuView.view.backgroundColor = .yellow
//        view.addSubview(menuView.view)
//        menuView.view.frame = CGRect(x: 0, y: 0, width: 350, height: self.view.frame.height)
        
        

//        view.addSubview(menuView.view)
        
    }
    
    @objc func handleClose() {
        print("Closing Menu..")
        transform(CGAffineTransform.identity)
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.menuView.view.transform = CGAffineTransform.identity
//        }, completion: nil)
//        menuView?.removeFromParent()
//        menuView?.view.removeFromSuperview()
//        menuView?.didMove(toParent: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
    
    fileprivate func setUpNavigationItems() {
        view.backgroundColor = .red
        
        navigationItem.title = "Home"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleClose))
    }
    
    fileprivate func addMenuViewController() {
        menuView.view.backgroundColor = .yellow
        let application = UIApplication.shared.keyWindow
        application?.addSubview(menuView.view)
        menuView.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        addChild(menuView)
        menuView.didMove(toParent: self)
    }
    

}

