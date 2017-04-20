//
//  RecipeSearchTableViewCell.swift
//  FurryAdventure
//
//  Created by Sang Saephan on 3/31/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class RecipeSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeTimerLabel: UILabel!
    @IBOutlet weak var numberOfIngredientsLabel: UILabel!
    var currentIngredients = [Ingredient]()
    
    func configureCell(recipe: Recipe, ingredients: [Ingredient]) {
        if let image = recipe.imageUrl {
            recipeImageView.setImageWith(image)
        }
        
        recipeNameLabel.text = recipe.name!
        
        if recipe.cookTime != 0 {
            recipeTimerLabel.text = "\((recipe.cookTime)!/60) Minutes"
        } else {
            recipeTimerLabel.text = "N/A"
        }
        
        currentIngredients = recipe.getIngredients()
        
        numberOfIngredientsLabel.text = "Missing \(currentIngredients.count-ingredients.count) of \(currentIngredients.count) Ingredients"
        
    }

}
