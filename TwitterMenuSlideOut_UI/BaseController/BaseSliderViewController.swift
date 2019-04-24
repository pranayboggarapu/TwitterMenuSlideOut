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
    var yellowViewLeadingConstraint: NSLayoutConstraint!
    var menuWidth: CGFloat = 300
    var isMenuOpened: Bool = false
    var acceptableGestureVelocity: CGFloat = 500

    var redView: UIView = {
        var v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var blueView: UIView = {
        var b = UIView()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .blue
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
        setupParentView()
        setupChildViewConstraints()
        setupPanGesture()
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
        yellowViewLeadingConstraint.constant = x
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
                performAnimation(menuWidth)
                return
            }
            if x < menuWidth/2 {
                performAnimation(0)
            } else {
                performAnimation(menuWidth)
            }
        } else {
            if abs(gestureVelocity) > acceptableGestureVelocity {
                performAnimation(0)
                return
            }
            if abs(gesture.translation(in: self.view).x)<menuWidth/2 {
                performAnimation(menuWidth)
            } else {
                performAnimation(0)
            }
        }
    }
    
    
    
    func performAnimation(_ widthConstant: CGFloat) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.setLeadingConstraints(widthConstant)
            
            self.yellowView.alpha = widthConstant == self.menuWidth ? 1 : 0
            
            self.isMenuOpened = widthConstant == self.menuWidth
            
            print("Menu opened \(self.isMenuOpened)")
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    fileprivate func setupParentView() {
        view.backgroundColor = .yellow
        view.addSubview(redView)
        view.addSubview(blueView)
    }
    
    fileprivate func setupChildViewConstraints() {
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            redView.rightAnchor.constraint(equalTo: view.rightAnchor),
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor)
            ])
        redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint.constant = 0
        redViewLeadingConstraint.isActive = true
    }
    
    fileprivate func setupViewControllers() {
        
        var homeController = ViewController()
        let homeView = homeController.view!
        homeView.translatesAutoresizingMaskIntoConstraints = false
        redView.addSubview(homeView)
        
        var menuController = MenuTableViewController()
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
        
        addChild(homeController)
        addChild(menuController)
    }
    
    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        view.addGestureRecognizer(panGesture)
    }
}
