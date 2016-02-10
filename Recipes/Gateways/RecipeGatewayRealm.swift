//
//  RecipeGatewayRealm.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/9/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import RealmSwift

class RecipeGatewayRealm: RecipeGateway {
  func create(recipe: Recipe) -> Recipe {
    let recipeModel = RecipeModel()
    recipeModel.title = recipe.title
    recipeModel.brief = recipe.brief
    recipeModel.dificultyLevel = recipe.dificultyLevel
    recipeModel.id = Int(NSDate().timeIntervalSince1970)
    
    let realm = try! Realm()
    try! realm.write {
      realm.add(recipeModel)
    }
    
    return generateStruct(recipeModel)
  }
  
  func generateStruct(recipe: RecipeModel) -> RecipeStruct {
    return RecipeStruct(
      id: recipe.id,
      title: recipe.title,
      brief: recipe.brief,
      dificultyLevel: recipe.dificultyLevel
    )
  }
}