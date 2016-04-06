//
//  RecipesAndIngredientsFormDelegate.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 4/6/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol RecipesAndIngredientsFormDelegate {
    func willSaveIngredient(ingredient: Ingredient)
}