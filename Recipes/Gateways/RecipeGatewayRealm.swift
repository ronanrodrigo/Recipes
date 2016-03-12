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
        let recipeModel = generateModel(recipe)
        recipeModel.id = Int(NSDate().timeIntervalSince1970) + NSUUID().hashValue
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(recipeModel)
        }
        
        return generateStruct(recipeModel)
    }
    
    func update(recipe: Recipe) -> Recipe {
        let recipeModel = generateModel(recipe)
        recipeModel.id = recipe.id
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(recipeModel, update: true)
        }
        
        return generateStruct(recipeModel)
    }
    
    func list() -> [Recipe] {
        let realm = try! Realm()
        return realm.objects(RecipeModel).map({return generateStruct($0)})
    }
    
    func generateStruct(recipe: RecipeModel) -> RecipeStruct {
        return RecipeStruct(
            id: recipe.id,
            title: recipe.title,
            brief: recipe.brief,
            dificultyLevel: recipe.dificultyLevel
        )
    }
    
    func generateModel(recipe: Recipe) -> RecipeModel {
        let recipeModel = RecipeModel()
        recipeModel.title = recipe.title
        recipeModel.brief = recipe.brief
        recipeModel.dificultyLevel = recipe.dificultyLevel
        
        return recipeModel
    }
    
}
