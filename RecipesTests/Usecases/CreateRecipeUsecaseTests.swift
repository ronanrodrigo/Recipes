//
//  CreateRecipeUsecase.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class CreateRecipeUsecaseTests: XCTestCase {
    var usecase: CreateRecipeUsecase!
    var presenter: CreateRecipePresenterSpy!
    var gateway: RecipeGatewayFake!
    var recipe: Recipe!
    
    override func setUp() {
        super.setUp()
        
        presenter = CreateRecipePresenterSpy()
        gateway = RecipeGatewayFake()
        usecase = CreateRecipeUsecase(gateway: gateway, presenter: presenter)
        recipe = RecipeStruct(
            id: 0,
            title: "Carrot cake",
            brief: "Simple and wonderful cake",
            dificultyLevel: .Easy)
    }
    
    func testShouldCreateRecipeWithAllInfos() {
        usecase.create(recipe)
        
        XCTAssertTrue(presenter.showedSpy)
    }
}
