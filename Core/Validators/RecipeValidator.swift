//
//  RecipeValidator.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

extension Recipe {
    func validate() -> (valid: Bool, errors: [RecipeError]) {
        return (!self.title.isEmpty, [RecipeError.EmptyTitle])
    }
}