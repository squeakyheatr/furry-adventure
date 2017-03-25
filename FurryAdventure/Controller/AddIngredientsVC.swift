//
//  AddIngredientsVC.swift
//  FurryAdventure
//
//  Created by Sang Saephan on 3/20/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class AddIngredientsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var categories = ["Vegetables", "Fruits", "Meat", "Dairy", "Grains and Carbs", "Herbs and Spices"]
    var images = [UIImage(named: "vegetables"), UIImage(named: "fruits"), UIImage(named: "meat"), UIImage(named: "dairy"), UIImage(named: "grains_and_carbs"), UIImage(named: "herbs_and_spices")]
    
    var ingredients = ["Apple", "Banana", "Cake", "Chicken Breast", "Chicken Feet"]
    var filteredIngredients = ["Apple", "Banana", "Cake", "Chicken Breast", "Chicken Feet"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddIngredientCell", for: indexPath) as! AddIngredientsCollectionCell
        
        cell.nameLabel.text = categories[indexPath.row]
        cell.posterImageView.image = images[indexPath.row]
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            tableView.isHidden = true
            collectionView.isHidden = false
        } else {
            tableView.isHidden = false
            collectionView.isHidden = true
        }
        
        filteredIngredients = searchText.isEmpty ? ingredients : ingredients.filter({
            $0.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchIngredientCell", for: indexPath)
        cell.textLabel?.text = filteredIngredients[indexPath.row]
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
