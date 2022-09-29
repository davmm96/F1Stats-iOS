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

    var items = [
        VersionModel(version: "0.1", date: "10/09/2022"),
        VersionModel(version: "0.2", date: "12/09/2022"),
        VersionModel(version: "0.6", date: "17/09/2022"),
        VersionModel(version: "0.8", date: "22/09/2022"),
        VersionModel(version: "1.0", date: "29/09/2022")
    ]
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        return createCommentCell(indexPath, tableView)
    }
    
    fileprivate func createCommentCell(_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell {
                let item = items[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

                cell.textLabel!.text = item.version + " " + item.date
                return cell
            }
}

  
