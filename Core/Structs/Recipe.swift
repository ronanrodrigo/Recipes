//
//  Recipe.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

protocol Recipe {
    var id: Int { get set }
    var title: String { get set }
    var brief: String? { get set }
    var dificultyLevel: DificultyLevel { get set }
}

extension Recipe {
    func isNewRecipe() -> Bool {
        return id == 0
    }
}

struct RecipeStruct: Recipe {
    var id: Int
    var title: String
    var brief: String?
    var dificultyLevel: DificultyLevel
}