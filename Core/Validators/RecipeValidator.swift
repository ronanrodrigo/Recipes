//
//  RecipeValidator.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

extension Recipe {
  func isValid() -> Bool {
    return self.validate().valid
  }
  
  func error() -> RecipeError {
    return self.validate().error
  }
  
  func validate() -> (valid: Bool, error: RecipeError) {
    return (!self.title.isEmpty, RecipeError.EmptyTitle)
  }
}