//
//  IngredientsFormController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 19/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class IngredientsFormController: UIViewController {
    var recipe: Recipe?
    var delegate: IngredientsFormControllerDelegate?
    var recipesAndIngredientsFormDelegate: RecipesAndIngredientsFormDelegate?
    var tableView: UITableView!
    var tableViewDataSource: IngredientsFormTableViewDataSource!
    let fieldsCellIdentifier = "FieldsCell"
        
    init(recipe: Recipe?, delegate: IngredientsFormControllerDelegate, recipesAndIngredientsFormDelegate: RecipesAndIngredientsFormDelegate) {
        self.recipe = recipe
        self.delegate = delegate
        self.recipesAndIngredientsFormDelegate = recipesAndIngredientsFormDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        configureTableView()
        configureTableViewCell()
        configureTableViewDataSource()
        configureNavigationItem()
    }
    
    func configureTableView() {
        tableView = UITableView(frame: view.frame, style: .Grouped)
        tableView.backgroundColor = ColorPalette.background
        tableView.backgroundView = nil
        view.addSubview(tableView)
    }
    
    func configureTableViewDataSource() {
        tableViewDataSource = IngredientsFormTableViewDataSource(recipe: recipe, fieldsCellIdentifier: fieldsCellIdentifier)
        tableView.dataSource = tableViewDataSource
    }
    
    func configureTableViewCell() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: fieldsCellIdentifier)
    }
    
    func configureNavigationItem() {
        navigationItem.title = "Ingredient"
        view.backgroundColor = ColorPalette.background
        let addButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(didTapAtSaveIngredient))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func didTapAtSaveIngredient(){
        let ingredient = IngredientStruct(
            title: tableViewDataSource.title.text!,
            quantity: Double(tableViewDataSource.quantity.text!)!,
            measureUnity: MeasureUnity.KG,
            recipe: recipe
        )
        delegate?.didTapAtSaveIngredient(ingredient)
        recipesAndIngredientsFormDelegate?.willSaveIngredient(ingredient)
    }

}
