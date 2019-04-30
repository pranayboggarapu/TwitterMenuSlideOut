//
//  ChatRoomContainerController.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/25/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class ChatRoomContainerController: UIViewController {

    var bottomController: TwitterMenuTableViewController = TwitterMenuTableViewController()
    var searchContainer: SearchContainer = SearchContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.2235294118, blue: 0.2901960784, alpha: 1)
        
        
        let communicationsView = bottomController.view!
        
        view.addSubview(communicationsView)
        view.addSubview(searchContainer)
        
        
        communicationsView.translatesAutoresizingMaskIntoConstraints = false
        communicationsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        communicationsView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        communicationsView.topAnchor.constraint(equalTo: searchContainer.bottomAnchor).isActive = true
        communicationsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        
        searchContainer.searchBar.delegate = bottomController
    }


}

class SearchContainer: UIView {
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Enter some text"
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .white
        return searchBar
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "rocket"))
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.1803921569, blue: 0.2431372549, alpha: 1)
        addSubview(searchBar)
        addSubview(imageView)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5).isActive = true
        searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 48).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
