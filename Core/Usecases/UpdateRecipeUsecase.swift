//
//  SaveRecipeUsecase.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/22/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

class UpdateRecipeUsecase {
  var gateway: RecipeGateway
  var presenter: UpdateRecipePresenter
  
  init(gateway: RecipeGateway, presenter: UpdateRecipePresenter) {
    self.gateway = gateway
    self.presenter = presenter
  }
  
  func update(recipe: RecipeStruct){
    gateway.update(recipe)
    self.presenter.show(recipe)
  }  
}
