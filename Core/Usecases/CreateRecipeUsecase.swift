//
//  CreateRecipeUsecase.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

class CreateRecipeUsecase {
    var gateway: RecipeGateway
    var presenter: CreateRecipePresenter
    
    init(gateway: RecipeGateway, presenter: CreateRecipePresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func create(recipe: Recipe) throws {
        if recipe.isValid() {
            let createdRecipe = self.gateway.create(recipe)
            self.presenter.show(createdRecipe)
        } else {
            throw recipe.error()
        }
    }
}