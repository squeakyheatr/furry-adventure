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
	
	init(client: RecipeApiClient!, id: String?, name: String?, ingredients: [Ingredient]?) {
		apiClient = client
		apiId = id
		self.name = name
		self.ingredients = ingredients
	}
	
	func getApiId() -> String! {
		return apiId!
	}
	
	func getIngredients() -> [Ingredient]! {
		return ingredients!
	}
	
	
}
