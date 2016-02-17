//
//  ListRecipesPresenter.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 10/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class ListRecipesIOS: ListRecipes {
  var view: UIView
  var recipesListControllerDelegate: RecipesListControllerDelegate
  var tableView: UITableView!
  var tableViewDataSource: RecipesListDataSource?
  var tableViewDelegate: RecipesListDelegate?
  let cellIdentifier = "RecipeCell"
  
  init(view: UIView, recipesListControllerDelegate: RecipesListControllerDelegate, tableView: UITableView) {
    self.view = view
    self.recipesListControllerDelegate = recipesListControllerDelegate
    self.tableView = tableView
  }
  
  func list(recipes: [Recipe]) {
    createTableViewDataSource(recipes)
    creaetTableViewDelegate(recipes)
    
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    
    view.addSubview(tableView)
  }
  
  func createTableViewDataSource(recipes: [Recipe]) {
    tableViewDataSource = RecipesListDataSource(recipes: recipes, cellIdentifier: cellIdentifier)
    tableView.dataSource = tableViewDataSource
  }
  
  func creaetTableViewDelegate(recipes: [Recipe]) {
    tableViewDelegate = RecipesListDelegate(recipes: recipes, recipesListControllerDelegate: recipesListControllerDelegate)
    tableView.delegate = tableViewDelegate
  }
}
