//
//  MenuTableViewController.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/7/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

struct MenuItem {
    
    let imageView: UIImage
    let menuSubItemLabel: String
}


extension MenuTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UIApplication.shared.keyWindow?.rootViewController as? BaseSliderViewController
        controller?.handleClose()
        controller?.handleMenuItemTap(indexPath)
    }
}

class MenuTableViewController: UITableViewController {

    var menuItemsList: [MenuItem] = [
        MenuItem(imageView: #imageLiteral(resourceName: "profile"), menuSubItemLabel: "Home"),
        MenuItem(imageView: #imageLiteral(resourceName: "lists"), menuSubItemLabel: "Lists"),
        MenuItem(imageView: #imageLiteral(resourceName: "bookmarks"), menuSubItemLabel: "Bookmarks"),
        MenuItem(imageView: #imageLiteral(resourceName: "moments"), menuSubItemLabel: "Items")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemsList.count
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuItemCellTableViewCell(style: .default, reuseIdentifier: "newId")
        cell.menuImageView.image = menuItemsList[indexPath.row].imageView
        cell.menuItemLabel.text = menuItemsList[indexPath.row].menuSubItemLabel
        print("The text for \(indexPath.row) is \(menuItemsList[indexPath.row].menuSubItemLabel)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MenuHeaderView()
        return headerView
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 200
//    }

}
