//
//  ListRecipesFake.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 10/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

class ListRecipesPresenterSpy: ListRecipesPresenter {
  var recipesSpy: [Recipe] = []
  var listedSpy: Bool = false
  
  func list(recipes: [Recipe]) {
    listedSpy = true
    recipesSpy = recipes
  }
}
