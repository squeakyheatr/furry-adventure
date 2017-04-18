//
//  EdamamApiClient.swift
//  FurryAdventure
//
//  Created by Edwin Young on 3/27/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit
import AFNetworking

class EdamamApiClient: RecipeApiClient, RecipeApiProtocol {
	
	static let shared = EdamamApiClient(baseUrlString: "https://api.edamam.com", key: "EdamamKey", app: "EdamamAppId")
	
	var authKey: String!
	var recipeSearchCache: [Recipe]?
	
	override init(baseUrlString: String!, key: String!, app: String?) {
		super.init(baseUrlString: baseUrlString, key: key, app: app)
		authKey = "app_id=\(appId!)&app_key=\(apiKey!)"
		
		EP_RECIPES_SEARCH = "/search"
		EP_RECIPE_SEARCH = nil
	}
	
	func findRecipes(by ingredients: [Ingredient]?, completion: @escaping DownloadComplete) -> [Recipe]? {
		let whitespace = NSCharacterSet.whitespaces
        var ingredientName = ""
        
        var urlString = apiUrlString + EP_RECIPES_SEARCH + "?" + authKey + "&q="
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
            urlString += "\(ingredientName),"
            ingredientName = ""
        }
		
		let url = URL(string: urlString)!
		let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
		let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
			if let data = data {
				if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
					//print(dataDictionary)
					
					// Have to unwrap the actual recipe dict, because Edamam is dumb that way
					let tempDict = dataDictionary["hits"] as! [NSDictionary]
					var recipesDict = Array<NSDictionary>()
					for dict in tempDict {
						recipesDict.append(dict["recipe"] as! NSDictionary)
					}
					
					var tempRecipes = Array<Recipe>()
					for dict in recipesDict {
						let name = dict["label"] as? String
						
						var ingredients = Array<Ingredient>()
						for ingredient in (dict["ingredientLines"] as! [String]) {
							ingredients.append(Ingredient(ingredient))
						}
                        
                        let imageUrl = URL(string: (dict["image"] as? String)!)
                        
                        let recipeUrl = dict["url"] as? String
                        
						
                        tempRecipes.append(Recipe(client: self, id: nil, name: name, ingredients: ingredients, imageUrl: imageUrl, cookTime: 0, recipeId: nil, recipeUrl: recipeUrl))
					}
					
					self.recipeSearchCache = tempRecipes
                    completion(self.recipeSearchCache!)
				}
			}
		}
		task.resume()
		
		return recipeSearchCache
	}
	
	func findRecipe(by id: String!, completion: @escaping (String) -> ()) -> Recipe? {
		
        completion(id)
		
		return nil
	}
}
