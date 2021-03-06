//
//  TwitterMenuTableViewController.swift
//  TwitterMenuSlideOut_UI
//
//  Created by Pranay Boggarapu on 4/24/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class CustomHeaderLabel: UILabel {
    
    var label : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Pranay"
        label.textColor = #colorLiteral(red: 0.4274509804, green: 0.3568627451, blue: 0.4196078431, alpha: 1)
        return label
    }()
    
    init(_ inputText: String) {
        super.init(frame: .zero)
        addSubview(label)
        label.text = inputText
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TwitterMenuTableViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("The changed text is \(searchText)")
        
        
        var changedSectionsData = sectionsData
        
        changedSectionsData.map { (group) -> ([String]) in
            print("The group data is \(group)")
            var individualStrings = group.value.filter({ (existingString) -> Bool in
                print("The existing String variable is \(existingString)")
                return existingString.lowercased().contains(searchText.lowercased())
            })
            resultsData[group.key] = individualStrings
            print("The individual Strings are \(individualStrings)")
            tableView.reloadData()
            return individualStrings
        }
//        changedSectionsData.map { (group) -> [String] in
//            print("The group data is \(group)")
//             var individualStrings = group.value.filter({ (existingString) -> Bool in
//                print("The existing String variable is \(existingString)")
//                return existingString.lowercased().contains(searchText.lowercased())
//            })
//            resultsData[group.key] = individualStrings
//            print("The individual Strings are \(individualStrings)")
//            tableView.reloadData()
//        }
        
//        changedSectionsData.forEach { (group,valueStrings) in
//            print("Value Strings is \(valueStrings)")
//            let filteredGroup = valueStrings.filter({ (currentString) -> Bool in
//                print("The current String is \(currentString)")
//                return currentString.lowercased().contains(searchText.lowercased())
//            })
//            print("My section changed is \(filteredGroup)")
//            resultsData[group] = filteredGroup
//            tableView.reloadData()
//        }
        print("Final Data after changing is \(resultsData)")
        
    }
}

class TwitterMenuTableViewController: UITableViewController {

    var resultsData = [String: [String]]()
    
    let sectionsData : [String: [String]] = [
        "UNREADS": ["general","introductions"],
        "CHANNELS": ["jobs"],
        "DIRECT MESSAGES": ["Pranay Boggarapu", "Steve Jobs", "Tim Cook", "Barack Obama"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.2235294118, blue: 0.2901960784, alpha: 1)
        resultsData = sectionsData
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("Section value is \(section)")
        return getSection(section)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        print("the value of number of sections is \(resultsData.count)")
        return resultsData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (resultsData[getSection(section)]?.count)!
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = CustomHeaderLabel(getSection(section))
        return label
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuTableViewCell(style: .default, reuseIdentifier: nil)
//        cell.textLabel?.text = sectionsData[getSection(indexPath.section)]![indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        let attributedText = NSMutableAttributedString(string: "#  ", attributes: [.foregroundColor: #colorLiteral(red: 0.4274509804, green: 0.3568627451, blue: 0.4196078431, alpha: 1), .font: UIFont.systemFont(ofSize: 18, weight: .regular)])
        attributedText.append(NSAttributedString(string: sectionsData[getSection(indexPath.section)]![indexPath.row], attributes: [.foregroundColor: UIColor.white]))
        cell.textLabel?.attributedText = attributedText
        return cell
    }
    
    func getSection(_ sectionNumber: Int) -> String {
        return (sectionNumber == 0 ? "UNREADS" : sectionNumber == 1 ? "CHANNELS" :"DIRECT MESSAGES")
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
}
