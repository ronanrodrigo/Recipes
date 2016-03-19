//
//  ListRecipesUsecase.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 10/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

class ListRecipesUsecase {
    var gateway: RecipeGateway
    var presenter: ListRecipesPresenter
    
    init(gateway: RecipeGateway, presenter: ListRecipesPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func list() {
        presenter.list(gateway.list())
    }
}
