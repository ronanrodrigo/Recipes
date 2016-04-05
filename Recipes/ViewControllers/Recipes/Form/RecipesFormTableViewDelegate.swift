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
    var recipe: Recipe?
    
    init(delegate: RecipesFormControllerDelegate, recipe: Recipe?) {
        self.delegate = delegate
        self.recipe = recipe
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate.didTapeedAtAddIngredients(recipe)
    }
}