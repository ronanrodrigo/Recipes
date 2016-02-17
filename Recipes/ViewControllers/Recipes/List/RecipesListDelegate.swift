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
  var recipesListController: RecipesListController
  
  init(recipes: [Recipe], recipesListController: RecipesListController) {
    self.recipes = recipes
    self.recipesListController = recipesListController
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    recipesListController.delegate?.didSelectRecipe(recipes[indexPath.row])
  }
  
}