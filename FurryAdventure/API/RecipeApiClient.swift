//
//  RecipeApiProtocol.swift
//  FurryAdventure
//
//  Created by Edwin Young on 3/24/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//
import UIKit

protocol RecipeApiProtocol {
	func findRecipes(by ingredients: [Ingredient]?, completion: @escaping DownloadComplete) -> [Recipe]?
	func findRecipe(by id: String!, completion: @escaping (String) -> ()) -> Recipe?
}

class RecipeApiClient {
	
	var apiUrlString: String!
	var apiKey: String!
	var appId: String?
	
	var EP_RECIPES_SEARCH: String!
	var EP_RECIPE_SEARCH: String!
	
	init(baseUrlString: String!, key: String!, app: String?) {
		apiUrlString = baseUrlString!
		
		var keys: NSDictionary?
		if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
			keys = NSDictionary(contentsOfFile: path)
		} else {
			print("Found no bundle")
		}
		
		if let dict = keys {
			apiKey = dict[key!] as! String
			
			if app != nil {
				appId = dict[app!] as? String
			} else {
				appId = nil
			}
			
			print("Loaded API keys.")
		} else {
			print("Found no key in Keys.plist")
		}
	}
}
