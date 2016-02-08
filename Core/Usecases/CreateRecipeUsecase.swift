//
//  CreateRecipeUsecase.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

class CreateRecipeUsecase {
    var gateway: RecipeGateway
    var presenter: ShowSavedRecipe

    init(gateway: RecipeGateway, presenter: ShowSavedRecipe) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func create(recipe: Recipe) throws {
        if recipe.isValid() {
            let savedRecipe = self.gateway.create(recipe)
            self.presenter.show(savedRecipe)
        } else {
            throw recipe.error()
        }
    }
}