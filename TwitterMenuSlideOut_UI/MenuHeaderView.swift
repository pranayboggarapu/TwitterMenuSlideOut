//
//  MenuHeaderView.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/20/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class MenuHeaderView: UIView {
    
    let userNameLabel = UILabel()
    let twitterHandle = UILabel()
    let numberOfFollowersLabel = UILabel()
    let userImageView = SizedImageView()
    

    
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = .white
        
        
        setUpLabels()
        
        setupStackView()
        
        
        
    }
    
    fileprivate func setupStackView() {
        //This is a hack
        //let stackView = UIStackView(arrangedSubviews:[UIView(),userNameLabel,twitterHandle,UIView(), UIView(), numberOfFollowersLabel])
        
        
        
        let stackView = UIStackView(arrangedSubviews: [UIStackView(arrangedSubviews: [userImageView, UIView()]), userNameLabel,ElementSpacer(4), twitterHandle,ElementSpacer(35),numberOfFollowersLabel])
        
        stackView.axis = .vertical
        
        //        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
    fileprivate func setUpLabels() {
        //Add UserName
        userNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        userNameLabel.text = "Pranay Boggarapu"
        
        
        //Add Twitter Handle
        twitterHandle.text = "@pranayboggarapu"
        
        
        
        
        //Adding the user image
        userImageView.image = UIImage(named: "girl_profile")
        userImageView.contentMode = .scaleAspectFit
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = 48/2
        
        //Add Number of followers
        setupStatsAttributedText()
        
    }
    
    fileprivate func setupStatsAttributedText() {
        let attributedText = NSMutableAttributedString(string: "42 ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .medium)])
        attributedText.append(NSAttributedString(string: "Following ", attributes: [.foregroundColor: UIColor.black ]))
        attributedText.append(NSAttributedString(string: "7091 ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)]))
        attributedText.append(NSAttributedString(string: "Followers", attributes: [.foregroundColor: UIColor.black ]))
        numberOfFollowersLabel.attributedText = attributedText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
