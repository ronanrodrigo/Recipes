//
//  RecipeModel.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 10/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import RealmSwift

class RecipeModel: Object, Recipe {
  dynamic var id: Int = 0
  dynamic var title: String = ""
  dynamic var brief: String?
  dynamic var dificultyLevelRaw: Int = DificultyLevel.Easy.hashValue
  
  var dificultyLevel: DificultyLevel {
    get {
      switch dificultyLevelRaw {
      case DificultyLevel.Hard.hashValue: return DificultyLevel.Hard
      case DificultyLevel.Medium.hashValue: return DificultyLevel.Medium
      default: return DificultyLevel.Easy
      }
    }
    set {
      self.dificultyLevelRaw = newValue.hashValue
    }
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
}
