//
//  DisplayRecipe.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

protocol ShowSavedRecipe {
  var delegate: RecipesFormControllerDelegate { get }
  
  func show(recipe: Recipe)
}