//
//  MeasureUnity.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

enum MeasureUnity: String {
    case KG, G, MG, UN, CupOfTea, Teaspoon, SoupSpoon
    
    func description() -> String {
        switch self {
        case .UN:
            return "Unity"
        case .CupOfTea:
            return "Cup of tea"
        case .Teaspoon:
            return "Tea spoon"
        case .SoupSpoon:
            return "Soup spoon"
        default:
            return self.rawValue
        }
    }
}