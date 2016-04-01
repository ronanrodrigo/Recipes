//
//  CreateIngredientInRecipeUsecase.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 30/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class CreateIngredientInRecipeUsecaseTests: XCTestCase {
    var ingredient: Ingredient!
    var usecase: CreateIngredientInRecipeUsecase!
    var presenter: CreateIngredientInRecipePresenterSpy!
    var gateway: IngredientGatewayFake!
    
    override func setUp() {
        super.setUp()
        
        presenter = CreateIngredientInRecipePresenterSpy()
        gateway = IngredientGatewayFake()
        usecase = CreateIngredientInRecipeUsecase(presenter: presenter, gateway: gateway)

        let recipe = RecipeGatewayFake().create(
            RecipeStruct(id: 0,
                title: "Pizza",
                brief: "",
                dificultyLevel: .Easy)
        )
        
        ingredient = IngredientStruct(
            title: "Corn",
            quantity: 20,
            measureUnity: .CupOfTea,
            recipe: recipe
        )
    }
    
    func testShouldCreateAnIngredient() {
        usecase.create(ingredient)
        
        let ingredients = gateway.list()
        XCTAssertEqual(1, ingredients.count)
        XCTAssertTrue(presenter.showedSpy)
    }
    
}