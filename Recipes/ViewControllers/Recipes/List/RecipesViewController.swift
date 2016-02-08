//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 07/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

protocol RecipesViewControllerDelegate {
    func didTappedAdd()
}

class RecipesViewController: UIViewController {
    var delegate: RecipesViewControllerDelegate
    var tableView: UITableView = UITableView()
    var tableViewDataSource: RecipesTableViewDataSource?
    var tableViewDelegate: RecipesTableViewDelegate?
    
    init(delegate: RecipesViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        createTableView()
    }
    
    func configureNavigation() {
        navigationItem.title = "Recipes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "newRecipe")
        navigationItem.rightBarButtonItem = addButton
    }
    
    func newRecipe(){
        delegate.didTappedAdd()
    }
    
    func createTableView() {
        tableViewDataSource = RecipesTableViewDataSource(recipes: ["Bolo de cenoura", "Bolo de chocolate"], cellIdentifier: "RecipeCell")
        tableView.dataSource = tableViewDataSource
        
        tableViewDelegate = RecipesTableViewDelegate()
        tableView.delegate = tableViewDelegate
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "RecipeCell")
        tableView.frame = view.frame
        view.addSubview(self.tableView)
    }

}
