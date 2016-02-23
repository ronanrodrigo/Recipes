//
//  SaveRecipeUsecaseTests.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/22/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class UpdateRecipesUsecaseTests: XCTestCase {
  var usecase: UpdateRecipeUsecase!
  var gateway: RecipeGatewayFake!
  var presenter: UpdateRecipePresenterSpy!
  
  override func setUp() {
    self.gateway = RecipeGatewayFake()
    self.presenter = UpdateRecipePresenterSpy()
    self.usecase = UpdateRecipeUsecase(gateway: gateway, presenter: presenter)
  }
  
  func testShouldUpdateAnExistRecipe() {
    let carrotCakeTitle = "Carrot cake"
    let brief = "Tasty"
    let dificultyLevel = DificultyLevel.Hard
    self.gateway.create(RecipeStruct(id: 0, title: "xxx", brief: "zzz", dificultyLevel: .Easy))
    
    self.usecase.update(RecipeStruct(
      id: 0,
      title: carrotCakeTitle,
      brief: brief,
      dificultyLevel: dificultyLevel))
    
    let recipes = self.gateway.list()
    XCTAssertEqual(1, recipes.count)
    XCTAssertEqual(carrotCakeTitle, recipes.first?.title)
    XCTAssertEqual(brief, recipes.first?.brief)
    XCTAssertEqual(dificultyLevel, recipes.first?.dificultyLevel)
  }
  
  func testShouldPresentTheUpdatedRecipe() {
    let carrotCakeTitle = "Carrot cake"
    let brief = "Tasty"
    let dificultyLevel = DificultyLevel.Hard
    self.gateway.create(RecipeStruct(id: 0, title: "xxx", brief: "zzz", dificultyLevel: .Easy))
    
    self.usecase.update(RecipeStruct(
      id: 0,
      title: carrotCakeTitle,
      brief: brief,
      dificultyLevel: dificultyLevel))
    
    XCTAssertEqual(carrotCakeTitle, self.presenter.spiedRecipe.title)
  }
}
