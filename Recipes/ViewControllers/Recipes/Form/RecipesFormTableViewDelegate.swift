//
//  RecipesFormDelegate.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 19/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesFormTableViewDelegate: NSObject, UITableViewDelegate {
    var delegate: RecipesFormControllerDelegate
    var recipesAndIngredientsFormDelegate: RecipesAndIngredientsFormDelegate
    var recipe: Recipe?
    
    init(delegate: RecipesFormControllerDelegate, recipe: Recipe?, recipesAndIngredientsFormDelegate: RecipesAndIngredientsFormDelegate) {
        self.delegate = delegate
        self.recipe = recipe
        self.recipesAndIngredientsFormDelegate = recipesAndIngredientsFormDelegate
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate.didTapAtAddIngredients(recipe, recipesAndIngredientsFormDelegate: recipesAndIngredientsFormDelegate)
    }
}