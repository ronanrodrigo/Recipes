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
        
        setNeedsStatusBarAppearanceUpdate()
        customizeNavigationController()
        setViewControllers([recipeListController], animated: false)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func customizeNavigationController() {
        navigationBar.tintColor = UIColor.whiteColor()
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        navigationBar.barTintColor = UIColor(red:1, green:0.76, blue:0.03, alpha:1)
    }
    
    // MARK: RecipesListControllerDelegate
    
    func didTapAtNewRecipe() {
        let recipesFormController = RecipesFormController(delegate: self)
        self.pushViewController(recipesFormController, animated: true)
    }
    
    func didSelectRecipe(recipe: Recipe) {
        let recipesFormController = RecipesFormController(delegate: self, recipe: recipe)
        self.pushViewController(recipesFormController, animated: true)
    }
    
    // MARK: RecipesFormControllerDelegate
    
    func didTapAtSaveRecipe(recipe: Recipe) {
        self.popViewControllerAnimated(true)
    }
    
}
