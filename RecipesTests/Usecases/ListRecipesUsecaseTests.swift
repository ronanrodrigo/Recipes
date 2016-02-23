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
  var presenter: ListRecipesSpy!
  var gateway: RecipeGatewayFake!
  
  override func setUp() {
    presenter = ListRecipesSpy()
    gateway = RecipeGatewayFake()
    self.usecase = ListRecipesUsecase(gateway: gateway, presenter: presenter)
  }
  
  func testShouldListAllRecipes() {
    createRecipe()
    
    self.usecase.list()
    
    XCTAssertEqual(self.gateway.recipes.count, self.presenter.recipesSpy.count)
  }
  
  func createRecipe() {
    gateway.create(RecipeStruct(
      id: 0,
      title: "Carrot cake",
      brief: "Simple and wonderful cake",
      dificultyLevel: .Easy))
  }
}
