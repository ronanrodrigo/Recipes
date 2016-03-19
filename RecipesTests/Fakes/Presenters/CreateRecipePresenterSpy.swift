//
//  CreateRecipePresenterFake.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

class CreateRecipePresenterSpy: CreateRecipePresenter {
    var showedSpy: Bool = false
    
    func show(recipe: Recipe) {
        showedSpy = true
    }
}
