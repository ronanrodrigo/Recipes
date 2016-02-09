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
  var recipe: Recipe!
  
  override func setUp() {
    super.setUp()
    
    presenter = ShowSavedRecipeFake()
    gateway = RecipeGatewayFake()
    usecase = CreateRecipeUsecase(gateway: gateway, presenter: presenter)
    recipe = RecipeStruct(
      title: "Carrot cake",
      description: "Simple and wonderful cake",
      dificultyLevel: .Easy)
  }
  
  func testShouldCreateRecipeWithAllInfos() {
    try! self.usecase.create(self.recipe)
    
    XCTAssertTrue(presenter.showed)
  }
  
  func testShouldNotCreateRecipeWithoutTitle() {
    recipe = RecipeStruct(
      title: "",
      description: "Simple and wonderful cake",
      dificultyLevel: .Easy
    )
    var error: RecipeError?
    
    do{
      try usecase.create(recipe)
    } catch RecipeError.EmptyTitle {
      error = RecipeError.EmptyTitle
    } catch { }
    
    XCTAssertFalse(presenter.showed)
    XCTAssertEqual(RecipeError.EmptyTitle, error)
  }
}