//
//  MenuItemCellTableViewCell.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/22/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class MenuItemCellTableViewCell: UITableViewCell {

    var menuImageView: IconImageView = {
       let menuView = IconImageView()
        menuView.contentMode = .scaleAspectFit
        menuView.clipsToBounds = true
        return menuView
    }()
    var menuItemLabel: UILabel = {
        let menuLabel = UILabel()
        return menuLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stackView = UIStackView(arrangedSubviews: [menuImageView, menuItemLabel, UIView()])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 12, bottom: 8, right: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
