//
//  MenuTableViewCell.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/24/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    var bgView: UIView = {
       let v = UIView()
        v.layer.cornerRadius = 5
        v.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.5960784314, blue: 0.5450980392, alpha: 1)
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bgView)
        
        selectionStyle = .none
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        bgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        sendSubviewToBack(bgView)
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
//        contentView.backgroundColor = selected ? .orange : .clear//UIColor(red: 83, green: 152, blue: 137, alpha: 0.1) : .clear
        
        bgView.isHidden = !selected
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
