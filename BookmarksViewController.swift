//
//  BookmarksViewController.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/24/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class BookmarksViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Bookmark for Row \(indexPath.row)"
        return cell
    }
    



}
