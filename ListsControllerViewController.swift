//
//  ListsControllerViewController.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/23/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class ListsControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Lists"
        label.font = UIFont.systemFont(ofSize: 64)
        label.frame = view.frame
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        
    }
}
