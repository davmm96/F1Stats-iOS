//
//  VersionsViewController.swift
//  F1 Stats
//
//  Created by David Melero Morant on 29/9/22.
//

import UIKit
import SwiftUI

struct VersionModel {
    var version: String
    var date: String
}

struct VersionsViewController: UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> UITableViewController {
        
        return VersionsTableViewController()
        
    }

    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {
        
    }
}

class VersionsTableViewController: UITableViewController {

    let items = [
        [
            VersionModel(version: "1.0", date: "29/09/22")
        ],
        [
            VersionModel(version: "0.8", date: "20/09/22"),
            VersionModel(version: "0.7", date: "18/09/22"),
            VersionModel(version: "0.6", date: "16/09/22"),
            VersionModel(version: "0.5", date: "10/09/22"),
            VersionModel(version: "0.4", date: "05/09/22"),
            VersionModel(version: "0.3", date: "01/09/22"),
            VersionModel(version: "0.2", date: "28/08/22"),
            VersionModel(version: "0.1", date: "20/08/22")
        ]
    ]
    
    let sections = [
        "Current",
        "Past"
    ]
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        return createCommentCell(indexPath, tableView)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        header.font = UIFont(name: "Formula1-Display-Bold", size: 13) ?? UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        header.text = sections[section]
        
        return header
    }
    
    fileprivate func createCommentCell(_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell {
        let item = items[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .value1, reuseIdentifier: "cell")

        var content = cell.defaultContentConfiguration()
        
        content.textProperties.color = .red
        content.textProperties.font = UIFont(name: "Formula1-Display-Bold", size: 15) ?? UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        content.text = item.version
        
        content.secondaryTextProperties.font = UIFont(name: "Formula1-Display-Regular", size: 14) ?? UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.black)
        content.secondaryText = item.date

        cell.contentConfiguration = content
        return cell
    }
}

  
