//
//  CategoryVC.swift
//  FurryAdventure
//
//  Created by Sang Saephan on 3/20/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var categoryIngredients: [String]!
    var checkedRows=Set<NSIndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryViewCell", for: indexPath)
        cell.textLabel?.text = categoryIngredients[indexPath.row].capitalized
        cell.accessoryType=self.accessoryForIndexPath(indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if checkedRows.contains(indexPath as NSIndexPath) {
            self.checkedRows.remove(indexPath as NSIndexPath)
        } else {
            self.checkedRows.insert(indexPath as NSIndexPath)
        }
        
        if let cell=tableView.cellForRow(at: indexPath) {
            cell.accessoryType=self.accessoryForIndexPath(indexPath: indexPath)
            
        }
    }
    
    func accessoryForIndexPath(indexPath: IndexPath) -> UITableViewCellAccessoryType {
        
        var accessory = UITableViewCellAccessoryType.none
        
        if self.checkedRows.contains(indexPath as NSIndexPath) {
            accessory=UITableViewCellAccessoryType.checkmark
        }
        
        return accessory
    }
    
    @IBAction func onCancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onAddPressed(_ sender: Any) {
        for index in checkedRows {
            cart.append(categoryIngredients[index.item])
        }
        dismiss(animated: true, completion: nil)
    }

}
