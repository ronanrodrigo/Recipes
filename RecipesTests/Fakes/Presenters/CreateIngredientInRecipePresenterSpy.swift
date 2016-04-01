//
//  CreateIngredientInRecipePresenterSpy.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 4/1/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class CreateIngredientInRecipePresenterSpy: CreateIngredientInRecipePresenter {
    var showedSpy = false
    
    func show(ingredient: Ingredient) {
        showedSpy = true
    }
}