//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 07/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class RecipesListController: UIViewController {
  var delegate: RecipesListControllerDelegate?
  var tableView: UITableView = UITableView()
  var tableViewDataSource: RecipesListDataSource?
  var tableViewDelegate: RecipesListDelegate?
  var recipes: [Recipe] = []
  
  init(delegate: RecipesListControllerDelegate) {
    self.delegate = delegate
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.delegate = nil
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigation()
    createTableView()
  }
  
  override func viewDidAppear(animated: Bool) {
    tableViewDataSource?.recipes = recipes
    tableView.reloadData()
  }
  
  func configureNavigation() {
    navigationItem.title = "Recipes"
    let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "newRecipe")
    navigationItem.rightBarButtonItem = addButton
  }
  
  func newRecipe(){
    if let delegate = self.delegate {
      delegate.newRecipeTapped()
    }
  }
  
  func createTableView() {
    tableViewDataSource = RecipesListDataSource(recipes: recipes, cellIdentifier: "RecipeCell")
    tableView.dataSource = tableViewDataSource
    
    tableViewDelegate = RecipesListDelegate()
    tableView.delegate = tableViewDelegate
    
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "RecipeCell")
    tableView.frame = view.frame
    view.addSubview(self.tableView)
  }
  
}
