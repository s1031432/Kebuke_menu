//
//  ViewController.swift
//  table
//
//  Created by 黃翊唐 on 2024/7/16.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let menuItems = [
        "Item 1",
        "Item 2",
        "Item 3",
        // Add more items as needed
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        // Other setup code
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
        
        // Configure the cell
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem
        
        return cell
    }
}

