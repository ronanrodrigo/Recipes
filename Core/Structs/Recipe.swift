//
//  Recipe.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

protocol Recipe {
  var title: String { get }
  var brief: String? { get }
  var dificultyLevel: DificultyLevel { get }
}

struct RecipeStruct: Recipe {
  var title: String
  var brief: String?
  var dificultyLevel: DificultyLevel
}