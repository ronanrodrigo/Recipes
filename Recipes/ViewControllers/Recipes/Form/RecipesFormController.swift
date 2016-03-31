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
    var recipe: Recipe?
    
    var tableView: UITableView!
    var tableViewDataSource: RecipesFormTableViewDataSource?
    var tableViewDelegate: RecipesFormTableViewDelegate?
    
    let fieldsCellIdentifier = "FieldsCell"
    let ingredientsCellIdentifier = "IngredientsCell"
    let stepsCellIdentifier = "StepsCell"
    
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
        configureNavigationItem()
        
        tableView.backgroundColor = ColorPalete.background
        tableView.backgroundView = nil
    }
    
    func configureNavigationItem() {
        navigationItem.title = recipe != nil ? "Edit recipe" : "New recipe"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(didTapAtSaveRecipe))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func createTableView() {
        tableView = UITableView(frame: view.frame, style: .Grouped)
        
        addDataSourceToTableView()
        addDelegateToTableView()
        registerCellsToTableView()
        
        view.addSubview(tableView)
    }
    
    func addDataSourceToTableView() {
        tableViewDataSource = RecipesFormTableViewDataSource(
            recipe: recipe,
            fieldsCellIdentifier: fieldsCellIdentifier,
            ingredientsCellIdentifier: ingredientsCellIdentifier,
            stepsCellIdentifier: stepsCellIdentifier
        )
        tableView.dataSource = tableViewDataSource
    }
    
    func addDelegateToTableView() {
        tableViewDelegate = RecipesFormTableViewDelegate(delegate: delegate!)
        tableView.delegate = tableViewDelegate
    }
    
    func registerCellsToTableView() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: fieldsCellIdentifier)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: ingredientsCellIdentifier)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: stepsCellIdentifier)
    }
    
    func didTapAtSaveRecipe() {
        let recipeStruct = RecipeStruct(
            id: recipe != nil ? recipe!.id : 0,
            title: (tableViewDataSource?.recipeTitle.text)!,
            brief: tableViewDataSource?.recipeDescription.text,
            dificultyLevel: .Easy
        )
        
        let gateway = RecipeGatewayRealm()
        
        if recipeStruct.isNewRecipe() {
            let presenter = CreateRecipePresenterIOS(delegate: delegate!)
            let usecase = CreateRecipeUsecase(gateway: gateway, presenter: presenter)
            usecase.create(recipeStruct)
        } else {
            let presenter = UpdateRecipePresenterIOS(delegate: delegate!)
            let usecase = UpdateRecipeUsecase(gateway: gateway, presenter: presenter)
            usecase.update(recipeStruct)
        }
    }
    
    
}
