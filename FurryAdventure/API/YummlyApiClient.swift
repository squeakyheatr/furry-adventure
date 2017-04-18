//
//  YummlyApiClient.swift
//  FurryAdventure
//
//  Created by Edwin Young on 3/27/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class YummlyApiClient: RecipeApiClient, RecipeApiProtocol {
	
	static let shared = YummlyApiClient(baseUrlString: "https://api.yummly.com/v1", key: "YummlyKey", app: "YummlyAppId")
	
	var authKey: String!
	
	// Needed to store/cache the results so we can display the results
	var recipeSearchCache: [Recipe]?
	
	// Needed to store the recipe detail data
	var recipeCache: Recipe?
	
	
	override init(baseUrlString: String!, key: String!, app: String?) {
		super.init(baseUrlString: baseUrlString, key: key, app: app)
		authKey = "_app_id=\(appId!)&_app_key=\(apiKey!)"
		
		EP_RECIPES_SEARCH = "/api/recipes"
		EP_RECIPE_SEARCH = "/api/recipe"
	}
	
    func findRecipes(by ingredients: [Ingredient]?, completion: @escaping DownloadComplete) -> [Recipe]? {
		let whitespace = NSCharacterSet.whitespaces
        var ingredientName = ""
        
		var urlString = apiUrlString + EP_RECIPES_SEARCH + "?" + authKey + "&"
		for ingredient in ingredients! {
            let range = ingredient.name.rangeOfCharacter(from: whitespace)
            
            // If ingredient name contains a space, add a "+" between the words
            if let test = range {
                let name = ingredient.name.components(separatedBy: " ")
                for word in name {
                    if name.index(of: word) == name.count-1 {
                        ingredientName += "\(word)"
                    } else {
                        ingredientName += "\(word)+"
                    }
                }
            } else {
                ingredientName = ingredient.name!
            }
			urlString += "allowedIngredient[]=\(ingredientName)&"
            ingredientName = ""
		}
		
		let url = URL(string: urlString)!
		let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
		let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
			if let data = data {
				if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
					//print(dataDictionary)
					
					// ETL Routine - Extract data from JSON, Transform into Recipe objects, Load into memory/cache
					
					// Extract the data from the JSON request
					let recipesDict = dataDictionary["matches"] as! [NSDictionary]
					
					var tempRecipes = Array<Recipe>()
					for dict in recipesDict {
						
						let id = dict["id"] as? String
						let name = dict["recipeName"] as? String
						
						var ingredients = Array<Ingredient>()
						for ingredient in (dict["ingredients"] as! [String]) {
							ingredients.append(Ingredient(ingredient))
						}
                        
                        var imageUrl: URL? = nil
                        if let imageUrlSize = dict["imageUrlsBySize"] as? NSDictionary {
                            if let url = imageUrlSize["90"] as? String {
                                imageUrl = URL(string: url)
                            }
                        }
                        
                        var cookTime: Int? = 0
                        if let time = dict["totalTimeInSeconds"] as? Int {
                            cookTime = time
                        }
                        
                        
						
                        tempRecipes.append(Recipe(client: self, id: id, name: name, ingredients: ingredients, imageUrl: imageUrl, cookTime: cookTime, recipeId: id, recipeUrl: nil))
					}
					
					self.recipeSearchCache = tempRecipes
                    completion(self.recipeSearchCache!)
				}
			}
		}
		task.resume()
		return recipeSearchCache
	}
	
	// Look into renaming this into "Retrieve recipe info"?
    func findRecipe(by id: String!, completion: @escaping (String) -> ()) -> Recipe? {
		
		let urlString = apiUrlString + EP_RECIPE_SEARCH + "/" + id + "?" + authKey
		
		let url = URL(string: urlString)!
		let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
		let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
			if let data = data {
				if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
					//print(dataDictionary)
					
					// Figure out how to handle individual recipes
                    let source = dataDictionary["source"] as? NSDictionary
                    let sourceSite = source?["sourceRecipeUrl"] as? String
                    
                    completion(sourceSite!)
				}
			}
		}
		task.resume()
		
		return nil
	}
}
