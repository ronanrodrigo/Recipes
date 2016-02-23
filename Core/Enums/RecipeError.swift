//
//  RecipeError.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

enum RecipeError: ErrorType {
    case EmptyTitle
    
    func description() -> String {
        switch self {
        case .EmptyTitle: return "EmptyTitle"
        }
    }
}