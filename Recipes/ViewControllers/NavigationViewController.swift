//
//  NavigationViewController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 07/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController, RecipesListControllerDelegate, RecipesFormControllerDelegate, IngredientsFormControllerDelegate {
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
        navigationBar.barTintColor = ColorPalette.primary
    }
    
    // MARK: RecipesListControllerDelegate
    
    func didTapAtNewRecipe() {
        let recipesFormController = RecipesFormController(delegate: self)
        pushViewController(recipesFormController, animated: true)
    }
    
    func didSelectRecipe(recipe: Recipe) {
        let recipesFormController = RecipesFormController(delegate: self, recipe: recipe)
        pushViewController(recipesFormController, animated: true)
    }
    
    // MARK: RecipesFormControllerDelegate
    
    func didTapAtSaveRecipe(recipe: Recipe) {
        popViewControllerAnimated(true)
    }
    
    func didTapAtAddIngredients(recipe: Recipe?) {
        let ingredientsFomrController = IngredientsFormController(recipe: recipe, delegate: self)
        pushViewController(ingredientsFomrController, animated: true)
    }
    
    // MARK: IngredientsFormControllerDelegate
    
    func didTapAtSaveIngredient(savedIngredient: Ingredient) {
        popViewControllerAnimated(true)
    }
}
