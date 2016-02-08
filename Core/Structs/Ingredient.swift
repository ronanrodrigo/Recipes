//
//  Ingredient.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

protocol Ingredient {
  var title: String { get }
  var quantity: Double { get }
  var measureUnity: MeasureUnity { get }
}

struct IngredientStruct: Ingredient {
  var title: String
  var quantity: Double
  var measureUnity: MeasureUnity
}