//
//  RecipeSearchVC.swift
//  FurryAdventure
//
//  Created by Sang Saephan on 3/20/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class RecipeSearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var recipes: [Recipe]!
    var ingredients = [Ingredient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if recipes.count == 0 {
            let alertController = UIAlertController(title: "No Recipes Found!", message:
                nil, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeSearchCell", for: indexPath) as! RecipeSearchTableViewCell
        cell.configureCell(recipe: recipes[indexPath.row], ingredients: ingredients)
        
        return cell
    }

    @IBAction func onBackButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "recipeDetail") {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let recipeData = recipes[(indexPath?.row)!]
            for ingred in recipeData.ingredients! {
                print (ingred.name)
            }
            
            let recipeDetailViewController = segue.destination as! RecipeDetailVC
            
            recipeDetailViewController.recipes = recipeData
            
            
            
            
        } else if (segue.identifier == "FilterView"){
            
            let filerVC = segue.destination as! FilterViewController
            filerVC.recipes = recipes
            filerVC.ingredients = ingredients
        }
    }
    
}
