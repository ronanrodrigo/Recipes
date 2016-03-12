//
//  Int+DificultyLevelToInteger.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 12/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

extension Int {
    func toDificultyLevel() -> DificultyLevel {
        switch self {
        case DificultyLevel.Hard.rawValue: return DificultyLevel.Hard
        case DificultyLevel.Medium.rawValue: return DificultyLevel.Medium
        default: return DificultyLevel.Easy
        }
    }
}
