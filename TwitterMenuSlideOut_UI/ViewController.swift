//
//  ViewController.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/7/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
//    var menuView: MenuTableViewController = MenuTableViewController()

    fileprivate let menuWidth: CGFloat = 350
    
    fileprivate var isMenuOpened: Bool = false
    
    fileprivate var gestureVelocity: CGFloat = 500
    
//    var darkendView = UIView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
        setUpNavigationItems()
//        addMenuViewController()
        //addPanGesture()
//        addDarkendView()
    }
    
//    func addDarkendView() {
//        var window = UIApplication.shared.keyWindow
//        darkendView.isUserInteractionEnabled = false
//        darkendView.backgroundColor = UIColor(white: 0, alpha: 0.8)
//        darkendView.frame = window?.frame ?? .zero
//        darkendView.alpha = 0
//        window?.addSubview(darkendView)
//    }
    
//    fileprivate func addPanGesture() {
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
//
//        view.addGestureRecognizer(panGesture)
//    }
    
//    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
//        let translation = gesture.translation(in: view)
//
//        if gesture.state == .changed {
//            print("Gesture changed")
//            var xPoint = translation.x
//            if isMenuOpened {
//                xPoint = xPoint + menuWidth
//            }
//            xPoint = min(menuWidth, xPoint)
//            xPoint = max(0, xPoint)
//            let transformValue = CGAffineTransform(translationX: xPoint, y: 0)
//            darkendView.alpha = xPoint/menuWidth
//            transform(transformValue)
//
//        } else if gesture.state == .ended {
//            print("Gesture ended")
//            handleEndGesture(gesture)
//        }
//
//
//
//        //transform(CGAffineTransform(translationX: translation.x, y: 0))
//
//    }
    
//    func transform(_ transformValue: CGAffineTransform) {
//        print("Animations happening")
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.menuView.view.transform = transformValue
//            self.navigationController?.view.transform = transformValue
//            self.darkendView.transform = transformValue
//
//
//
//
//
//        })
//    }
    
//    fileprivate func handleEndGesture(_ gesture: UIPanGestureRecognizer) {
//        let translation = gesture.translation(in: view)
//        var xPoint = translation.x
//        var gesActualVelocity = gesture.velocity(in: view).x
//        if isMenuOpened {
//
//            if abs(gesActualVelocity) > gestureVelocity {
//                handleClose()
//                return
//            }
//
//            if abs(xPoint) < menuWidth/2 {
//                handleOpen()
//            } else {
//                handleClose()
//            }
//        } else {
//
//            if abs(gesActualVelocity) > gestureVelocity {
//                handleOpen()
//                return
//            }
//
//
//            if xPoint < menuWidth/2 {
//                handleClose()
//            } else {
//                handleOpen()
//            }
//        }
//
//
//    }
    
    
    
    
//    @objc func handleOpen() {
//        print("Opening Menu...")
//        transform(CGAffineTransform(translationX: menuWidth, y: 0))
//        darkendView.alpha = 1
//        isMenuOpened = true
////        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
////            self.menuView.view.transform = CGAffineTransform(translationX: self.menuWidth, y: 0)
////        }, completion: nil)
////        let vc = ViewController()
////        vc.view.frame = view.frame
////        vc.view.backgroundColor = .yellow
////        view.addSubview(vc.view)
////
//////        let menuView = UIView()
//////        menuView.backgroundColor = .yellow
//////        menuView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
////
////        let menuView = MenuTableViewController()
////        menuView.view.backgroundColor = .yellow
////        view.addSubview(menuView.view)
////        menuView.view.frame = CGRect(x: 0, y: 0, width: 350, height: self.view.frame.height)
//
//
//
////        view.addSubview(menuView.view)
//
//    }
    
//    @objc func handleClose() {
//        print("Closing Menu..")
//        darkendView.alpha = 0
//        transform(CGAffineTransform.identity)
//        isMenuOpened = false
////        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
////            self.menuView.view.transform = CGAffineTransform.identity
////        }, completion: nil)
////        menuView?.removeFromParent()
////        menuView?.view.removeFromSuperview()
////        menuView?.didMove(toParent: nil)
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        
        cell.textLabel?.text = "Row for in the item: \(indexPath.row)"
        return cell
    }
    
    fileprivate func setUpNavigationItems() {
        //view.backgroundColor = .red

        navigationItem.title = "Home"

//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))

        var imageButton: UIButton = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "girl_profile").withRenderingMode(.alwaysOriginal)
        imageButton.setImage(image, for: .normal)
        imageButton.contentMode = .scaleAspectFit
        imageButton.clipsToBounds = true
        imageButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageButton.layer.cornerRadius = 20
        
        imageButton.addTarget(self, action: #selector(handleOpen), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: imageButton)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleClose))
    }
    
    @objc func handleOpen() {
       (UIApplication.shared.keyWindow?.rootViewController as? BaseSliderViewController)?.handleOpen()
    }
    
    @objc func handleClose() {
        (UIApplication.shared.keyWindow?.rootViewController as? BaseSliderViewController)?.handleClose()
    }
    
//    fileprivate func addMenuViewController() {
//        menuView.view.backgroundColor = .yellow
//        let application = UIApplication.shared.keyWindow
//        application?.addSubview(menuView.view)
//        menuView.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
//        addChild(menuView)
//        menuView.didMove(toParent: self)
//    }
    

}

