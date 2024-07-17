//
//  ViewController.swift
//  table
//
//  Created by 黃翊唐 on 2024/7/16.
//

import UIKit

struct MenuItem: Codable {
    let name: String
    let price: [String: Int]
    let describe: String
    let imgsrc: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    // Data source array
    var menuItems: [MenuItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register the custom cell
        tableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: "MenuItemCell")
        fetchMenuItems()
    }
    
    func fetchMenuItems() {
guard let url = URL(string: Bundle.main.object(forInfoDictionaryKey: "API_URL") as! String) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data: \(String(describing: error))")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([MenuItem].self, from: data)
                DispatchQueue.main.async {
                    self.menuItems = decodedData
                    self.tableView.reloadData()
                    print(self.menuItems)
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath) as! MenuItemTableViewCell
        
        let menuItem = menuItems[indexPath.row]
        cell.nameLabel.text = menuItem.name
        cell.priceLabel.text = "M: \(menuItem.price["m"] ?? 0) L: \(menuItem.price["l"] ?? 0)"
        cell.descriptionLabel.text = menuItem.describe
        
        if let imageUrl = URL(string: menuItem.imgsrc) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        cell.itemImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        return cell
    }
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuItem = menuItems[indexPath.row]
        print("Selected item: \(menuItem.name)")
    }
}

