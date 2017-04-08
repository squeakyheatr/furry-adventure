//
//  Constants.swift
//  FurryAdventure
//
//  Created by Sang Saephan on 3/28/17.
//  Copyright © 2017 Sticky Gerbils. All rights reserved.
//

import Foundation

var cart = [String]()

typealias DownloadComplete = ([Recipe]) -> ()

let vegetables = ["garlic", "onion", "olive", "tomato", "potato", "salad greens", "carrot", "basil", "parsley", "rosemary", "bell pepper", "chili pepper", "corn", "ginger", "mushroom", "broccoli", "spinach", "green beans", "celery", "red onion", "cilantro", "cucumber", "pickle", "dill", "avocado", "sweet potato", "zucchini", "shallot", "mixed vegetable", "cabbage", "asparagus", "cauliflower", "mint", "pumpkin", "kale", "frozen vegetables", "scallion", "squash", "sun dried tomato", "horseradish", "sweet corn", "beet"]

let fruits = ["lemon", "banana", "apple", "coconut", "mango", "lime", "orange", "pineapple", "strawberries", "raisin", "blueberries", "grapefruit", "grape", "prunes", "nectarine", "fig", "peach", "cranberries", "raspberries", "pear", "cherry", "apricot", "blackberries", "berries", "date", "watermelon", "kiwi", "craisins", "mandarin", "cantaloupe", "plum", "papaya", "pomegranate", "apple butter", "clementine", "rhubarb", "tangerine", "sultanas", "currant", "plantain", "passion fruit", "persimmons", "quince", "lychee", "tangelos", "lingonberry", "kumquat", "boysenberry", "star fruit", "guava"]

let meat = ["chicken breast", "ground beef", "bacon", "sausage", "cooked chicken", "ham", "veal", "beef steak", "hot dog", "pork chops", "chicken thighs", "ground turkey", "pork", "turkey", "pepperoni", "whole chicken", "chicken leg", "ground pork", "chicken wings", "chorizo", "polish sausage", "salami", "pork roast","ground chicken", "pork ribs", "venison", "spam", "lamb", "pork shoulder", "beef roast", "bratwurst", "prosciutto", "chicken roast", "bologna", "corned beef", "lamb chops", "ground lamb", "beef ribs", "duck", "pancetta", "beef liver", "leg of lamb", "chicken giblets", "beef shank", "pork belly", "cornish hen", "lamb shoulder", "lamb shank"]

let dairy = ["butter", "eggs", "milk", "parmesan", "cheddar", "cream", "sour cream", "cream cheese", "mozzarella", "american cheese", "yogurt", "evaporated milk", "condensed milk", "whipped cream", "half and half", "monterey jack cheese", "feta", "cottage cheese", "ice cream", "goat cheese", "frosting", "swiss cheese", "buttermilk", "velveeta", "ricotta", "powdered milk", "blue cheese", "provolone", "colby cheese", "gouda", "pepper jack", "italian cheese", "soft cheese", "romano", "brie", "pepperjack cheese", "custard", "cheese soup", "pizza cheese", "ghee", "pecorino cheese", "gruyere", "creme fraiche", "neufchatel", "muenster", "asiago", "queso fresco cheese", "hard cheese", "havarti cheese", "mascarpone"]

let grainsAndCarbs = ["wheat germ", "flour", "rice", "pasta", "bread", "baking powder", "bread flour", "baking soda", "bread crumbs", "cornstarch", "semolina", "noodle", "rolled oats", "yeast", "cracker", "quinoa", "pancake mix", "flour tortillas", "cornmeal", "chips", "saltines", "brown rice", "popcorn", "self rising flour", "macaroni cheese mix", "corn tortillas", "stuffing mix", "biscuits", "couscous", "pie crust", "pita", "bisquick", "cereal", "angel hair", "croutons", "lasagne", "ramen", "baguette", "pizza dough", "barley", "puff pastry", "cake mix", "bagel", "pretzel", "cream of wheat", "multigrain bread", "crescent roll dough", "pierogi", "hot dog bun", "filo dough", "wheat", "ravioli", "muffin mix", "gnocchi", "bread dough", "potato flakes", "rye", "croissants", "matzo meal", "shortcrust pastry", "ciabatta", "breadsticks", "angel food", "risotto", "spelt"]

let herbsAndSpices = ["red pepper flake", "cinnamon", "chive", "vanilla", "garlic powder", "oregano", "paprika", "cayenne", "chili powder", "cumin", "italian seasoning", "thyme", "peppercorn", "nutmeg", "onion powder", "curry powder", "clove", "bay leaf", "taco seasoning", "sage", "ground nutmeg", "chinese five spice", "allspice", "turmeric", "ground coriander", "coriander", "cajun seasoning", "steak seasoning", "herbs", "celery salt", "vanilla essence", "poultry seasoning", "marjoram", "tarragon", "cardamom", "celery seed", "garam masala", "mustard seed", "chile powder", "italian herbs", "saffron", "caraway", "herbes de provence", "italian spice", "star anise", "savory", "dill seed", "aniseed", "cacao", "tamarind"]

let fish = ["canned tuna", "salmon", "fish fillets", "tilapia", "haddock", "grouper", "cod", "flounder", "anchovies", "tuna steak", "rockfish", "sardines", "smoked salmon", "monkfish", "canned salmon", "whitefish", "halibut", "trout", "mahi mahi", "catfish", "sea bass", "mackerel", "swordfish", "sole", "red snappe", "pollock", "herring", "perch", "caviar", "pike", "bluefish", "lemon sole", "eel", "carp", "cuttlefish", "barramundi"]

let oil = ["vegetable oil", "olive oil", "peanut oil", "cooking spray", "shortening", "lard", "almond oil", "grape seed oil"]

let seafood = ["shrimp", "cockle", "crawfish", "crab", "scallop", "prawns", "clam", "lobster", "octopus", "calamari", "squid", "oyster", "mussel"]

let sweeteners = ["sugar", "honey", "confectioners sugar", "maple syrup", "syrup", "molasses", "corn syrup"]

let seasonings = ["cream of tartar", "bouillon", "ground ginger", "sesame seed", "apple cider", "chili sauce", "liquid smoke", "balsamic glaze", "hoisin sauce", "vegetable bouillon", "soya sauce", "rice wine", "rose water", "fish stock", "champagne vinegar"]

let nuts = ["peanut butter", "chestnut", "almond", "cashew", "walnut", "peanut", "pecan", "flax", "pine nut", "pistachio", "almond meal", "praline", "hazelnut", "macadamia", "almond paste", "macaroon"]

let condiments = ["mayonnaise", "mustard", "ketchup", "vinegar", "balsamic vinegar", "wine vinegar", "cider vinegar", "rice vinegar", "mirin", "apple cider vinegar", "fish sauce", "blue cheese dressing"]

let dessertsAndSnacks = ["chocolate", "apple sauce", "graham cracker", "marshmallow", "potato chips", "pudding mix", "chocolate morsels", "bittersweet chocolate", "cookie dough", "chocolate syrup", "Nutella"]

let beverages = ["apple juice", "coffee", "orange juice", "tea", "espresso", "tomato juice", "green tea", "cranberry juice", "coke", "lemonade", "ginger ale", "pineapple juice", "fruit juice", "club soda", "sprite", "grenadine", "margarita mix"]

let soup = ["chicken broth", "mushroom soup", "beef broth", "tomato soup", "vegetable stock", "chicken soup", "celery soup", "onion soup", "vegetable soup", "dashi"]

let dairyAlternatives = ["soy milk", "almond milk", "coconut milk", "hemp milk"]

let legumes = ["peas", "black beans", "chickpea", "lentil", "hummus", "soybeans", "pinto beans", "cannellini beans", "navy beans", "kidney beans", "lima beans", "green beans", "french beans"]

let sauces = ["tomato sauce", "tomato paste", "chicken gravy", "pesto", "beef gravy", "alfredo sauce", "curry paste"]

let alcohol = ["liqueur", "whiskey", "beer", "white wine", "red wine", "champagne", "rum", "frangelico", "brandy", "vodka", "tequila", "sherry", "bitters", "cooking wine", "bourbon", "kahlua", "gin", "whisky", "irish cream", "sake", "amaretto", "vermouth", "triple sec", "grappa", "masala", "grand marnier", "cabernet sauvignon", "dessert wine", "schnapps", "port wine", "burgundy wine", "sparkling wine", "cognac", "chocolate liqueur", "curacao", "creme de menthe", "limoncello", "raspberry liquor", "bloody mary", "shaoxing wine", "madeira wine", "absinthe", "ciclon", "ouzo", "anisette"]
