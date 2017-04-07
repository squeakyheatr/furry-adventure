//
//  RecipeDetailVC.swift
//  FurryAdventure
//
//  Created by Sang Saephan on 3/20/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class RecipeDetailVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var recipes: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        YummlyApiClient.shared.findRecipe(by: recipes.recipeId!) { (sourceSite) in
            let url = URL(string: sourceSite)
            let requestObj = URLRequest(url: url!)
            self.webView.loadRequest(requestObj)

        }

    }
    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }

}
