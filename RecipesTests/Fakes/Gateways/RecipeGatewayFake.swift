//
//  RecipeGatewayFake.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

class RecipeGatewayFake: RecipeGateway {
    var recipes: [Recipe]
    
    init() {
        recipes = []
    }
    
    func create(recipe: Recipe) -> Recipe {
        recipes.append(recipe)
        return recipe
    }
    
    func update(recipe: Recipe) -> Recipe {
        if let index = recipes.indexOf({ $0.id == recipe.id }) {
            recipes[index] = recipe
        }
        
        return recipe
    }
    
    func list() -> [Recipe] {
        return recipes
    }
}
