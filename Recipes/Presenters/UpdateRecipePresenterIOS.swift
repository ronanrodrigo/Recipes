//
//  CreateRecipePresenterIOS.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/9/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class UpdateRecipePresenterIOS: UpdateRecipePresenter {
    var delegate: RecipesFormControllerDelegate
    
    init(delegate: RecipesFormControllerDelegate) {
        self.delegate = delegate
    }
    
    func show(recipe: Recipe) {
        self.delegate.didTapAtSaveRecipe(recipe)
    }
}
