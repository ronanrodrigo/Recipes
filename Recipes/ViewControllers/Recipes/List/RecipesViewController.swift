//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 07/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    var tableView: UITableView = UITableView()
    var dataSource: RecipesTableViewDataSource?
    var delegate: RecipesTableViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        createTableView()
    }
    
    func configureNavigation() {
        navigationItem.title = "Recipes"
    }
    
    func createTableView() {
        dataSource = RecipesTableViewDataSource(recipes: ["Bolo de cenoura", "Bolo de chocolate"], cellIdentifier: "RecipeCell")
        tableView.dataSource = dataSource
        
        delegate = RecipesTableViewDelegate()
        tableView.delegate = delegate
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "RecipeCell")
        tableView.frame = view.frame
        view.addSubview(self.tableView)
    }

}
