//
//  Recipe.swift
//  FurryAdventure
//
//  Created by Edwin Young on 3/24/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class Recipe: NSObject {
	var apiClient: RecipeApiClient!
	var apiId: String?
	var name: String?
	var ingredients: [Ingredient]?
    var imageUrl: URL?
    var cookTime: Int?
    var recipeId: String?
	
    init(client: RecipeApiClient!, id: String?, name: String?, ingredients: [Ingredient]?, imageUrl: URL?, cookTime: Int?, recipeId: String?) {
		apiClient = client
		apiId = id
		self.name = name
		self.ingredients = ingredients
        self.imageUrl = imageUrl
        self.cookTime = cookTime
        self.recipeId = recipeId
	}
	
	func getApiId() -> String! {
		return apiId!
	}
	
	func getIngredients() -> [Ingredient]! {
		return ingredients!
	}
	
	
}
