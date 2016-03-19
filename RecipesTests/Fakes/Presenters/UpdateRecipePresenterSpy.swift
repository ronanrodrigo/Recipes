//
//  UpdateRecipePresenterSpy.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 23/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

class UpdateRecipePresenterSpy:UpdateRecipePresenter{
    
    var spiedRecipe: Recipe!
    
    func show(recipe: Recipe) {
        spiedRecipe = recipe
    }
    
}