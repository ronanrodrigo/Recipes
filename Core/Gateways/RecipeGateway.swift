//
//  RecipeGateway.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

protocol RecipeGateway {
  func create(recipe: Recipe) -> Recipe
  func update(recipe: Recipe) -> Recipe
  func list() -> [Recipe]
}
