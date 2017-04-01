//
//  RecipeDetailVC.swift
//  FurryAdventure
//
//  Created by Sang Saephan on 3/20/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class RecipeDetailVC: UIViewController {

    
    var recipes: Recipe!

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipePicture: UIImageView!
    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    recipeName.text = recipes.name
    recipePicture.setImageWith(recipes.imageUrl! as URL)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
