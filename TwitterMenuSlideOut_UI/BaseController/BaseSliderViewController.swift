//
//  BaseSliderViewController.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/17/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class BaseSliderViewController: UIViewController {
    
    var redViewLeadingConstraint: NSLayoutConstraint!
    var redViewTrailingConstraint: NSLayoutConstraint!
    var yellowViewLeadingConstraint: NSLayoutConstraint!
    var menuWidth: CGFloat = 300
    var isMenuOpened: Bool = false
    var acceptableGestureVelocity: CGFloat = 500
    var menuController = TwitterMenuTableViewController()

    var redView: UIView = {
        var v = UIView()
        //v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isMenuOpened ? .lightContent: .default
    }
    
    var blueView: UIView = {
        var b = UIView()
        b.translatesAutoresizingMaskIntoConstraints = false
       // b.backgroundColor = .blue
        return b
    }()
    
    var yellowView: UIView = {
        var b = UIView()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.isUserInteractionEnabled = true
        b.backgroundColor = UIColor(white: 0, alpha: 0.8)
        b.alpha = 0
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        setupParentView()
        setupChildViewConstraints()
        setupPanGesture()
        setupTouchGesture()
        setupViewControllers()
        addYellowView()
    }
    
    fileprivate func addYellowView() {
        view.addSubview(yellowView)
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            yellowView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        
        yellowViewLeadingConstraint = yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        yellowViewLeadingConstraint.constant = 0
        yellowViewLeadingConstraint.isActive = true
    }
    
    fileprivate func setLeadingConstraints(_ x: CGFloat) {
        redViewLeadingConstraint.constant = x
        redViewTrailingConstraint.constant = x
        yellowViewLeadingConstraint.constant = x
    }
    
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        handleClose()
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        
        var x = gesture.translation(in: self.view).x
        
        x = isMenuOpened ? x+300 : x
        x = min(x,menuWidth)
        x = max(0,x)
        print("x value is \(x)")
        if gesture.state == .changed {
            setLeadingConstraints(x)
            yellowView.alpha = x/menuWidth
            
        } else {
            handleEnded(gesture)
        }
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        var x = gesture.translation(in: self.view).x
        
        var gestureVelocity = gesture.velocity(in: self.view).x
        
        x = isMenuOpened ? x+300 : x
        
        if !isMenuOpened {
            if gestureVelocity > acceptableGestureVelocity {
                handleOpen()
                return
            }
            if x < menuWidth/2 {
                handleClose()
            } else {
                handleOpen()
            }
        } else {
            if abs(gestureVelocity) > acceptableGestureVelocity {
                handleClose()
                return
            }
            if abs(gesture.translation(in: self.view).x)<menuWidth/2 {
                handleOpen()
            } else {
                handleClose()
            }
        }
    }
    
    func handleOpen() {
        performAnimation(menuWidth)
    }
    
    func handleClose() {
        performAnimation(0)
    }
    
    func performAnimation(_ widthConstant: CGFloat) {
        print("Im in perform animation function")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.setLeadingConstraints(widthConstant)
            
            self.yellowView.alpha = widthConstant == self.menuWidth ? 1 : 0
            
            self.isMenuOpened = widthConstant == self.menuWidth
            self.setNeedsStatusBarAppearanceUpdate()
            print("Menu opened \(self.isMenuOpened)")
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    var parentController: UIViewController = UINavigationController(rootViewController: ViewController())
    
    func handleMenuItemTap(_ indexPath: IndexPath) {
        performRightSideViewCleanup()
        handleClose()
        switch indexPath.row {
        case 0:
            print("Home tapped")
            parentController = UINavigationController(rootViewController: ViewController())
            
        case 1:
            print("Lists tapped")
            parentController = UINavigationController(rootViewController: ListsControllerViewController())
            
        case 2:
            print("Bookmarks tapped")
            parentController = BookmarksViewController()
        
        default:
            print("Items tapped")
            let tabBarController = UITabBarController()
            let controller = UIViewController()
            controller.navigationItem.title = "Moments"
            let navController = UINavigationController(rootViewController: controller)
            navController.tabBarItem.title = "Moments"
            tabBarController.viewControllers = [navController]
            parentController = tabBarController
            
        }
        redView.addSubview(parentController.view)
        addChild(parentController)
        redView.bringSubviewToFront(yellowView)
        
    }
    
    func performRightSideViewCleanup() {
        parentController.view.removeFromSuperview()
        parentController.removeFromParent()
    }
    
    
    fileprivate func setupParentView() {
        //view.backgroundColor = .yellow
        view.addSubview(redView)
        view.addSubview(blueView)
    }
    
    fileprivate func setupChildViewConstraints() {
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor)
            ])
        
        redViewTrailingConstraint = redView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        redViewTrailingConstraint.isActive = true
        
        redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint.constant = 0
        redViewLeadingConstraint.isActive = true
    }
    
    fileprivate func setupViewControllers() {
        
        let homeView = parentController.view!
        homeView.translatesAutoresizingMaskIntoConstraints = false
        redView.addSubview(homeView)
        
        
        let menuView = menuController.view!
        menuView.translatesAutoresizingMaskIntoConstraints = false
        blueView.addSubview(menuView)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: redView.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor)
            ,
            menuView.topAnchor.constraint(equalTo: blueView.topAnchor),
            menuView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
            menuView.rightAnchor.constraint(equalTo: blueView.rightAnchor),
            menuView.leftAnchor.constraint(equalTo: blueView.leftAnchor)
            ])
        
        addChild(parentController)
        addChild(menuController)
    }
    
    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        view.addGestureRecognizer(panGesture)
    }
    
    fileprivate func setupTouchGesture() {
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        yellowView.addGestureRecognizer(touchGesture)
    }
}
