//
//  RecipesFormController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesFormController: UIViewController {
    var delegate: RecipesFormControllerDelegate?
    var tableView: UITableView!
    var tableViewDataSource: RecipesFormDataSource?
    var recipe: Recipe?
    
    init(delegate: RecipesFormControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    init(delegate: RecipesFormControllerDelegate, recipe: Recipe) {
        self.delegate = delegate
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.delegate = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        createTableView()
        configureNavigation()
        
        self.tableView.backgroundColor = UIColor.background()
        self.tableView.backgroundView = nil
    }
    
    func configureNavigation() {
        navigationItem.title = recipe != nil ? "Edit recipe" : "New recipe"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "didTapAtSaveRecipe")
        navigationItem.rightBarButtonItem = addButton
    }
    
    func createTableView() {
        self.tableView = UITableView(frame: view.frame, style: .Grouped)
        tableViewDataSource = RecipesFormDataSource(cellIdentifier: "RecipesFormCell", recipe: recipe)
        tableView.dataSource = tableViewDataSource
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "RecipesFormCell")
        tableView.frame = view.frame
        view.addSubview(tableView)
    }
    
    func didTapAtSaveRecipe() {
        let recipeStruct = RecipeStruct(
            id: recipe != nil ? recipe!.id : 0,
            title: (tableViewDataSource?.recipeTitle.text)!,
            brief: tableViewDataSource?.recipeDescription.text,
            dificultyLevel: .Easy
        )
        
        let gateway = RecipeGatewayRealm()
        
        if recipeStruct.id != 0 {
            let presenter = UpdateRecipePresenterIOS(delegate: self.delegate!)
            let usecase = UpdateRecipeUsecase(gateway: gateway, presenter: presenter)
            usecase.update(recipeStruct)
        } else {
            let presenter = CreateRecipePresenterIOS(delegate: self.delegate!)
            let usecase = CreateRecipeUsecase(gateway: gateway, presenter: presenter)
            usecase.create(recipeStruct)
        }
    }
    
    
}
