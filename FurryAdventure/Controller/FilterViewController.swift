//
//  FilterViewController.swift
//  FurryAdventure
//
//  Created by Robert Mitchell on 4/3/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet var nutSwitch: UISwitch!
    @IBOutlet var fishSwitch: UISwitch!
    @IBOutlet var wheatSwitch: UISwitch!
    @IBOutlet var soySwitch: UISwitch!
    @IBOutlet var shellfishSwitch: UISwitch!
    @IBOutlet var dairySwitch: UISwitch!
    @IBOutlet var peanutSwitch: UISwitch!
    
    var ingredients =  [Ingredient]()
    var recipes: [Recipe]?
    var newRecipes =  [Recipe]()
    var allergyCheck: Bool = false
    
    //allergies arrays sorry so long
    let dairy = ["gorgonzola","cheese","butter", "eggs", "milk", "parmesan", "cheddar", "cream", "sour cream", "cream cheese", "mozzarella", "american cheese", "yogurt", "evaporated milk", "condensed milk", "whipped cream", "half and half", "monterey jack cheese", "feta", "cottage cheese", "ice cream", "goat cheese", "frosting", "swiss cheese", "buttermilk", "velveeta", "ricotta", "powdered milk", "blue cheese", "provolone", "colby cheese", "gouda", "pepper jack", "italian cheese", "soft cheese", "romano", "brie cheese", "pepperjack cheese", "custard", "cheese soup", "pizza cheese", "ghee", "pecorino cheese", "gruyere", "creme fraiche", "neufchatel", "muenster", "asiago", "queso fresco cheese", "hard cheese", "havarti cheese", "mascarpone"]
    
    let nuts = ["chestnut", "almond", "cashew", "walnut", "pecan", "flax", "pine nut", "pistachio", "almond meal", "praline", "hazelnut", "macadamia", "almond paste", "macaroon"]
    
    
    let fish = ["canned tuna", "salmon", "fish fillets", "tilapia", "haddock", "grouper", "cod", "flounder", "anchovies", "tuna steak", "rockfish", "sardines", "smoked salmon", "monkfish", "canned salmon", "whitefish", "halibut", "trout", "mahi mahi", "catfish", "sea bass", "mackerel", "swordfish", "sole", "red snapper", "pollock", "herring", "perch", "caviar", "pike", "bluefish", "lemon sole", "eel", "carp", "cuttlefish", "barramundi"]
    
    let grainsAndCarbs = ["wheat germ", "flour", "rice", "pasta", "bread", "baking powder", "bread flour", "baking soda", "bread crumbs", "cornstarch", "semolina", "noodle", "rolled oats", "yeast", "cracker", "quinoa", "pancake mix", "flour tortillas", "cornmeal", "chips", "saltines", "brown rice", "popcorn", "self rising flour", "macaroni cheese mix", "corn tortillas", "stuffing mix", "biscuits", "couscous", "pie crust", "pita", "bisquick", "cereal", "angel hair", "croutons", "lasagne", "ramen", "baguette", "pizza dough", "barley", "puff pastry", "cake mix", "bagel", "pretzel", "cream of wheat", "multigrain bread", "crescent roll dough", "pierogi", "hot dog bun", "filo dough", "wheat", "ravioli", "muffin mix", "gnocchi", "bread dough", "potato flakes", "rye", "croissants", "matzo meal", "shortcrust pastry", "ciabatta", "breadsticks", "angel food", "risotto", "spelt", "gluten"]
    
    let seafood = ["shrimp", "cockle", "crawfish", "crab", "scallop", "prawns", "clam", "lobster", "octopus", "calamari", "squid", "oyster", "mussel"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nutSwitch.isOn =  UserDefaults.standard.bool(forKey: "nutSwitchState")
        peanutSwitch.isOn =  UserDefaults.standard.bool(forKey: "peanutSwitchState")
        fishSwitch.isOn =  UserDefaults.standard.bool(forKey: "fishSwitchState")
        soySwitch.isOn =  UserDefaults.standard.bool(forKey: "soySwitchState")
        shellfishSwitch.isOn =  UserDefaults.standard.bool(forKey: "shellfishSwitchState")
        dairySwitch.isOn =  UserDefaults.standard.bool(forKey: "dairySwitchState")
        wheatSwitch.isOn =  UserDefaults.standard.bool(forKey: "wheatSwitchState")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newRecipes = [Recipe]()
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
    //send in switch states as params
    

    @IBAction func onAllergyAdded(_ sender: Any) {
        for recipe in recipes! {
            //if peanutcheckswitch is true
            print("peanut Switch is \(peanutSwitch.isOn)")
            if peanutSwitch.isOn {
                print(recipe.name)
                var ingred = recipe.getIngredients()
                for ingredient in ingred! {
                    print(ingredient.name)
                    if ingredient.name.lowercased().contains("peanut") {
                        allergyCheck = true
                    }
                }
            }
            //            print("dairy Switch is \(dairySwitch.isOn)")
            //            if dairySwitch.isOn == true {
            //                print(recipe.name)
            //                var ingred = recipe.getIngredients()
            //                for ingredient in ingred! {
            //                    print(ingredient.name)
            //                    for dar in dairy {
            //                        if (ingredient.name.range(of: "cheese") != nil) || (ingredient.name.range(of: "milk") != nil) {
            //                            allergyCheck = true
            //                        }
            //                    }
            //                }
            //            }
            if dairySwitch.isOn {
                var ingredients = recipe.getIngredients()
                for ingredient in ingredients! {
                    dairyAllergyCheck(ingredientName: ingredient.name, allergies: dairy)
                }
            }
            
            
            print("shellfishSwitch is \(shellfishSwitch.isOn)")
            if shellfishSwitch.isOn {
                print(recipe.name)
                var ingred = recipe.getIngredients()
                for ingredient in ingred! {
                    print(ingredient.name)
                    shellFishAllergyCheck(ingredientName: ingredient.name, allergies: seafood)
                }
            }
            
            print("soySwitch is \(soySwitch.isOn)")
            if soySwitch.isOn {
                print(recipe.name)
                var ingred = recipe.getIngredients()
                for ingredient in ingred! {
                    print(ingredient.name)
                    if ingredient.name.lowercased().contains("soy") {
                        allergyCheck = true
                    }
                }
            }
            print("wheatSwitch is \(wheatSwitch.isOn)")
            if wheatSwitch.isOn {
                print(recipe.name)
                var ingred = recipe.getIngredients()
                for ingredient in ingred! {
                    print(ingredient.name)
                    gluttenAllergyCheck(ingredientName: ingredient.name, allergies: grainsAndCarbs)
                    
                }
            }
            print("fishSwitch is \(fishSwitch.isOn)")
            if fishSwitch.isOn {
                print(recipe.name)
                var ingred = recipe.getIngredients()
                for ingredient in ingred! {
                    fishAllergyCheck(ingredientName: ingredient.name, allergies: fish)
                }
            }
            print("nutSwitch is \(nutSwitch.isOn)")
            if nutSwitch.isOn {
                print(recipe.name)
                var ingred = recipe.getIngredients()
                for ingredient in ingred! {
                    print(ingredient.name)
                    nutsAllergyCheck(ingredientName: ingredient.name, allergies: nuts)
                }
            }
            //if dairycheckswitch is true
            //            var ingred = recipe.getIngredients()
            //            for ingredient in ingred! {
            //            if ingredient.name == "peanut" {
            //                peanutCheck = true
            //            }
            
            
            //final check before appending
            if allergyCheck == false {
                print("Has no allergies, appending")
                newRecipes.append(recipe)
                print (newRecipes.count)
            }
            allergyCheck = false
        }
        
        let storyboard = UIStoryboard(name: "RecipeSearchView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipeSearchVC") as! RecipeSearchVC
        print("New count of recipes \(newRecipes.count)")
        viewController.recipes = newRecipes
        viewController.ingredients = ingredients
        self.present(viewController, animated: true, completion: nil)
    }

    @IBAction func saveSwitchPressed(_ sender: UISwitch) {
        UserDefaults.standard.set(nutSwitch.isOn, forKey: "nutSwitchState")
        UserDefaults.standard.set(peanutSwitch.isOn, forKey: "peanutSwitchState")
        UserDefaults.standard.set(wheatSwitch.isOn, forKey: "wheatSwitchState")
        UserDefaults.standard.set(shellfishSwitch.isOn, forKey: "shellfishSwitchState")
        UserDefaults.standard.set(soySwitch.isOn, forKey: "soySwitchState")
        UserDefaults.standard.set(dairySwitch.isOn, forKey: "dairySwitchState")
        UserDefaults.standard.set(fishSwitch.isOn, forKey: "fishSwitchState")        
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func dairyAllergyCheck(ingredientName: String, allergies: [String]) {
        for allergy in allergies {
            if ingredientName.lowercased().contains(allergy) {
                allergyCheck = true
            }
        }
    }
    
    func gluttenAllergyCheck(ingredientName: String, allergies: [String]) {
        for allergy in allergies {
            if ingredientName.lowercased().contains(allergy) {
                allergyCheck = true
            }
        }
    }
    
    func shellFishAllergyCheck(ingredientName: String, allergies: [String]) {
        for allergy in allergies {
            if ingredientName.lowercased().contains(allergy) {
                allergyCheck = true
            }
        }
    }
    
    func nutsAllergyCheck(ingredientName: String, allergies: [String]) {
        for allergy in allergies {
            if ingredientName.lowercased().contains(allergy) {
                allergyCheck = true
            }
        }
    }
    
    func fishAllergyCheck(ingredientName: String, allergies: [String]) {
        for allergy in allergies {
            if ingredientName.lowercased().contains(allergy) {
                allergyCheck = true
            }
        }
    }
}
//things to work on, going back to previous page
// Saving original list,
// working on actually filtering everything


//func filterRecipes(recipes: [Recipe], peanutCheck: Bool, dairyCheck: Bool, soyCheck: Bool, nutCheck: Bool, fishCheck: Bool, shellFishCheck: Bool, wheatCheck: Bool ) {
//
//
//}




