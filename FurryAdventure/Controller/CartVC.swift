//
//  CartVC.swift
//  FurryAdventure
//
//  Created by Sang Saephan on 3/20/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartViewCell", for: indexPath)
        cell.textLabel?.text = cart[indexPath.row].capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // Deletes an item from the cart
        if editingStyle == .delete {
            cart.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    @IBAction func onFindRecipesPressed(_ sender: Any) {
        var ingredients = [Ingredient]()
        
        for index in 0..<cart.count {
            let newIngredient = Ingredient(cart[index])
            ingredients.append(newIngredient)
        }
        
        YummlyApiClient.shared.findRecipes(by: ingredients) {recipes in
            let storyboard = UIStoryboard(name: "RecipeSearchView", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "RecipeSearchVC") as! RecipeSearchVC
            viewController.recipes = recipes
            viewController.ingredients = ingredients
            
            EdamamApiClient.shared.findRecipes(by: ingredients, completion: { (recipes) in
                for recipe in recipes {
                    viewController.recipes.append(recipe)
                }
                self.present(viewController, animated: true, completion: nil)
            })
        }
    }
}
