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
    var presenter: ShowSavedRecipeFake!
    var gateway: RecipeGatewayFake!
    var ingredients: [Ingredient]!
    var steps: [Step]!
    var recipe: Recipe!
    
    override func setUp() {
        super.setUp()
        
        presenter = ShowSavedRecipeFake()
        gateway = RecipeGatewayFake()
        usecase = CreateRecipeUsecase(gateway: gateway, presenter: presenter)
        
        ingredients = [
            IngredientStruct(title: "Oil", quantity: 0.5, measureUnity: .CupOfTea),
            IngredientStruct(title: "Carrot", quantity: 3, measureUnity: .UN)
        ]
        
        steps = [
            StepStruct(sequence: 1, description: "In blender, mix the carrot with eggs and oil"),
            StepStruct(sequence: 2, description: "Add the sugar and mix for more 5 minutes")
        ]

        recipe = RecipeStruct(
            title: "Carrot cake",
            description: "Simple and wonderful cake",
            dificultyLevel: .Easy,
            ingredients: ingredients,
            steps: steps)
    }
    
    func testShouldCreateRecipeWithAllInfos() {
        try! self.usecase.create(self.recipe)

        XCTAssertTrue(presenter.showed)
    }
    
    func testShouldNotCreateRecipeWithoutTitle() {
        recipe = RecipeStruct(
            title: "",
            description: "Simple and wonderful cake",
            dificultyLevel: .Easy,
            ingredients: ingredients,
            steps: steps)
        var error: String = String()

        do{
            try usecase.create(recipe)
        } catch RecipeError.EmptyTitle {
            error = RecipeError.EmptyTitle.description()
        } catch { }
        
        XCTAssertFalse(presenter.showed)
        XCTAssertEqual(RecipeError.EmptyTitle.description(), error)
    }
}