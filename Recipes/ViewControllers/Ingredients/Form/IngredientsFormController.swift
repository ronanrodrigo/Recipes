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
    var tableView: UITableView!
    var tableViewDataSource: IngredientsFormTableViewDataSource!
    let fieldsCellIdentifier = "FieldsCell"
        
    init(recipe: Recipe?) {
        self.recipe = recipe
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
    }
}
