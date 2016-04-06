//
//  CreateIngredientInRecipeUsecase.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 30/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class CreateIngredientInRecipeUsecase {
    var presenter: CreateIngredientInRecipePresenter
    var gateway: IngredientGateway
    
    init(presenter: CreateIngredientInRecipePresenter, gateway: IngredientGateway) {
        self.presenter = presenter
        self.gateway = gateway
    }
    
    func create(ingredient: Ingredient) {
        let createdIngredient = self.gateway.create(ingredient)

        self.presenter.show(createdIngredient)
    }
    
}