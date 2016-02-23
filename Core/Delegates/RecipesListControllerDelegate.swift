//
//  RecipesListControllerDelegate.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/9/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

protocol RecipesListControllerDelegate {
    func didTapAtNewRecipe()
    func didSelectRecipe(recipe: Recipe)
}
