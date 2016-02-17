//
//  RecipesTablewViewDelegate.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesListDelegate: NSObject, UITableViewDelegate {
  var recipes: [Recipe]
  var recipesListControllerDelegate: RecipesListControllerDelegate
  
  init(recipes: [Recipe], recipesListControllerDelegate: RecipesListControllerDelegate) {
    self.recipes = recipes
    self.recipesListControllerDelegate = recipesListControllerDelegate
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    recipesListControllerDelegate.didSelectRecipe(recipes[indexPath.row])
  }
  
}