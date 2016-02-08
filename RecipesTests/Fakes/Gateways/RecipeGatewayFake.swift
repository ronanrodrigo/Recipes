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
}