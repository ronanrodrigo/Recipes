//
//  IngredientGatewayFake.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 4/1/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class IngredientGatewayFake: IngredientGateway {
    var ingredients: [Ingredient] = []
    
    func create(ingredient: Ingredient) -> Ingredient {
        ingredients.append(ingredient)
        return ingredient
    }
    
    func update(ingredient: Ingredient) -> Ingredient {
        return ingredient
    }
    
    func list() -> [Ingredient] {
        return ingredients
    }
}