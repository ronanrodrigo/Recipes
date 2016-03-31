//
//  CreateIngredientInRecipeUsecase.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 30/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class CreateIngredientInRecipePresenterSpy: CreateIngredientInRecipePresenter {
    var showedSpy = false

    func show(ingredient: Ingredient) {
        showedSpy = true
    }
}

class IngredientGatewayFake: IngredientGateway {
    var ingredients: [Ingredient] = []
    
    func create(ingredient: Ingredient) -> Ingredient {
        ingredients.append(ingredient)
        return ingredient
    }
    
    func update(ingredient: Ingredient) -> Ingredient {
        return ingredient
    }
    
    func list() -> [Ingredient] {
        return ingredients
    }
}

class CreateIngredientInRecipeUsecaseTests: XCTestCase {
    var ingredient: Ingredient!
    var usecase: CreateIngredientInRecipeUsecase!
    var presenter: CreateIngredientInRecipePresenterSpy!
    var gateway: IngredientGatewayFake!
    
    var recipe: Recipe!
    var recipeGateway: RecipeGatewayFake!
    
    override func setUp() {
        super.setUp()
        
        presenter = CreateIngredientInRecipePresenterSpy()
        gateway = IngredientGatewayFake()
        usecase = CreateIngredientInRecipeUsecase(presenter: presenter, gateway: gateway)

        recipeGateway = RecipeGatewayFake()
        recipe = recipeGateway.create(
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