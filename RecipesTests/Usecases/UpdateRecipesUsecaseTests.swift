//
//  SaveRecipeUsecaseTests.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/22/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class UpdateRecipesUsecaseTests: XCTestCase {
    let recipeId = 1
    let otherRecipeId = 2
    let title = "Carrot cake"
    let brief = "Tasty"
    let dificultyLevel = DificultyLevel.Hard
    
    var usecase: UpdateRecipeUsecase!
    var gateway: RecipeGatewayFake!
    var presenter: UpdateRecipePresenterSpy!
    
    override func setUp() {
        self.gateway = RecipeGatewayFake()
        self.presenter = UpdateRecipePresenterSpy()
        self.usecase = UpdateRecipeUsecase(gateway: gateway, presenter: presenter)
    }
    
    func testShouldUpdateAnExistRecipe() {
        gateway.create(RecipeStruct(id: recipeId, title: "xxx", brief: "zzz", dificultyLevel: .Easy))
        
        usecase.update(RecipeStruct(
            id: recipeId,
            title: title,
            brief: brief,
            dificultyLevel: dificultyLevel))
        
        let recipes = gateway.list()
        XCTAssertEqual(1, recipes.count)
        XCTAssertEqual(title, recipes.first?.title)
        XCTAssertEqual(brief, recipes.first?.brief)
        XCTAssertEqual(dificultyLevel, recipes.first?.dificultyLevel)
    }
    
    func testShouldPresentTheUpdatedRecipe() {
        gateway.create(RecipeStruct(id: recipeId, title: "xxx", brief: "zzz", dificultyLevel: .Easy))
        let recipeStruct = RecipeStruct(
            id: recipeId,
            title: title,
            brief: brief,
            dificultyLevel: dificultyLevel)
        
        usecase.update(recipeStruct)
        
        let recipes = gateway.list()
        XCTAssertEqual(1, recipes.count)
        XCTAssertEqual(title, presenter.spiedRecipe.title)
        XCTAssertEqual(presenter.spiedRecipe as? RecipeStruct, recipeStruct)
    }
    
}
