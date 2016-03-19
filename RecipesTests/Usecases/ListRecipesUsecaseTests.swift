//
//  ListRecipesUsecaseTests.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 10/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class ListRecipesUsecaseTests: XCTestCase {
    var usecase: ListRecipesUsecase!
    var presenter: ListRecipesPresenterSpy!
    var gateway: RecipeGatewayFake!
    
    override func setUp() {
        presenter = ListRecipesPresenterSpy()
        gateway = RecipeGatewayFake()
        usecase = ListRecipesUsecase(gateway: gateway, presenter: presenter)
    }
    
    func testShouldListAllRecipes() {
        createRecipe()
        
        usecase.list()
        
        XCTAssertEqual(gateway.recipes.count, presenter.recipesSpy.count)
    }
    
    func createRecipe() {
        gateway.create(RecipeStruct(
            id: 0,
            title: "Carrot cake",
            brief: "Simple and wonderful cake",
            dificultyLevel: .Easy))
    }
}
