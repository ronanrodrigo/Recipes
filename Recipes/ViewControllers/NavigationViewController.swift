//
//  NavigationViewController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 07/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController, RecipesListControllerDelegate, RecipesFormControllerDelegate {
  var recipeListController: RecipesListController!
  
  override func viewDidLoad() {
    recipeListController = RecipesListController(delegate: self)
    self.setViewControllers([recipeListController], animated: false)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: RecipesViewControllerDelegate
  
  func newRecipeTapped() {
    let recipesFormController = RecipesFormController(delegate: self)
    self.pushViewController(recipesFormController, animated: true)
  }
  
  // MARK: RecipesFormControllerDelegate
  
  func saveRecipeTapped(recipe: Recipe) {
    self.popViewControllerAnimated(true)
    recipeListController.recipes.append(recipe)
  }
  
}
