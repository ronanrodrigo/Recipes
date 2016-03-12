//
//  Equatable+Recipe.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 12/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

extension RecipeStruct: Equatable {}

func ==(first: RecipeStruct, second: RecipeStruct) -> Bool {
    let equalsBriefs = first.brief == second.brief
    let equalsTitles = first.title == second.title
    let equalsDificulties = first.dificultyLevel == second.dificultyLevel
    return equalsBriefs && equalsTitles && equalsDificulties
}
