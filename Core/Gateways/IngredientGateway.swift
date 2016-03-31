//
//  IngredientGateway.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 30/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

protocol IngredientGateway {
    func create(ingredient: Ingredient) -> Ingredient
    func update(ingredient: Ingredient) -> Ingredient
    func list() -> [Ingredient]
}