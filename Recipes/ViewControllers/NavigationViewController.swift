//
//  NavigationViewController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 07/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController, RecipesListControllerDelegate, RecipesFormControllerDelegate {
  
  override func viewDidLoad() {
    let controller = RecipesListController(delegate: self)
    self.setViewControllers([controller], animated: false)
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
  
  func saveRecipeTapped() {
    self.popViewControllerAnimated(true)
  }
  
}
