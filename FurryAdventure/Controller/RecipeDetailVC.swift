//
//  RecipeDetailVC.swift
//  FurryAdventure
//
//  Created by Sang Saephan on 3/20/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit
import PKHUD

class RecipeDetailVC: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var recipes: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        HUD.dimsBackground = false
        
        YummlyApiClient.shared.findRecipe(by: recipes.recipeId!) { (sourceSite) in
            HUD.show(.label("Loading Recipe Details..."))
            let url = URL(string: sourceSite)
            let requestObj = URLRequest(url: url!)
            self.webView.loadRequest(requestObj)
        }

    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        HUD.hide(animated: true)
    }
    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }

}
