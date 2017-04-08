////
////  SpoonacularApiClient.swift
////  FurryAdventure
////
////  Created by Edwin Young on 3/27/17.
////  Copyright © 2017 Sticky Gerbils. All rights reserved.
////
//
//import UIKit
//import AFNetworking
//
//class SpoonacularApiClient: RecipeApiClient, RecipeApiProtocol {
//
//	static let shared = SpoonacularApiClient(baseUrlString: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes", key: "SpoonacularKey", app: nil)
//	
//	override init(baseUrlString: String!, key: String!, app: String?) {
//		super.init(baseUrlString: baseUrlString, key: key, app: app)
//		
//		EP_RECIPES_SEARCH = "/findByIngredients"
//		EP_RECIPE_SEARCH = "/information"
//	}
//	
//	// API requests to Spoonacular API require HTTP headers instead of passing via query string; specifically
//	// X-Mashape-Key: ${SPOONACULAR_KEY}
//	// Accept: application/json
//	func findRecipes(by ingredients: [Ingredient]?) -> [Recipe]? {
//		// Modify request headers for API calls
//		let requestSerializer = AFNetworking.AFHTTPRequestSerializer()
//		requestSerializer.setValue(apiKey!, forHTTPHeaderField: "X-Mashape-Key")
//		requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
//		
//		// Set up API endpoint calls & query string params
//		var urlString = apiUrlString + EP_RECIPES_SEARCH + "?";
//		var params = [
//			"fillIngredients": "false",
//			"limitLicense": "false",
//			"number": "10",
//			"ranking": "2" // this is to minimize the number of missing ingredients
//		]
//		
//		// API takes the ingredients as a list of comma separated values
//		if ingredients != nil && ingredients!.count >= 1 {
//			params["ingredients"] = ingredients![0].name
//			for i in 1..<ingredients!.count {
//				params["ingredients"] = params["ingredients"]! + "," + ingredients![i].name
//			}
//		} else {
//			return nil
//		}
//		
//		// Create & URL encode the ingredients values
//		var queryString = ""
//		for (key, value) in params {
//			queryString = queryString + "\(key)=\(value)&"
//		}
//		queryString = queryString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
//		urlString = urlString + queryString
//		
//		// Call the API endpoint
//		let request = requestSerializer.request(withMethod: "GET", urlString: urlString, parameters: nil, error: nil)
//		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//		let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
//			if let data = data {
//				if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
//					print(dataDictionary)
//					
//					// Can't even run this bit of code
//					// Maybe look into this? Would bypass AFNetworking.AFHTTPRequestSerializer entirely
//					// http://stackoverflow.com/a/37245658
//				}
//			}
//		}
//		task.resume()
//	}
//	
//	func findRecipe(by id: String!) -> Recipe? {
//		let requestSerializer = AFNetworking.AFHTTPRequestSerializer()
//		requestSerializer.setValue(apiKey!, forHTTPHeaderField: "X-Mashape-Key")
//		requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
//		
//		// Set up API endpoint calls
//		var urlString = apiUrlString + "/" + id + EP_RECIPES_SEARCH;
//		
//		// Call the API endpoint
//		let request = requestSerializer.request(withMethod: "GET", urlString: urlString, parameters: nil, error: nil)
//		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//		let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
//			if let data = data {
//				if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
//					print(dataDictionary)
//					
//					// Can't even run this bit of code
//				}
//			}
//		}
//		task.resume()
//		
//		return nil
//	}
//	
//	
//	
//}
