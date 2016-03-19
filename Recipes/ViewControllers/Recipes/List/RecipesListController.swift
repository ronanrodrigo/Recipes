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
    var presenter: ListRecipesPresenter!
    var gateway: RecipeGateway!
    var usecase: ListRecipesUsecase!
    var tableView: UITableView!
    
    init(delegate: RecipesListControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        tableView = UITableView(frame: view.frame)
        gateway = RecipeGatewayRealm()
        presenter = ListRecipesPresenterIOS(view: view, recipesListControllerDelegate: delegate!, tableView: tableView)
        usecase = ListRecipesUsecase(gateway: gateway, presenter: presenter)
        configureNavigation()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        usecase.list()
    }
    
    func configureNavigation() {
        navigationItem.title = "Recipes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "didTapAtNewRecipe")
        navigationItem.rightBarButtonItem = addButton
    }
    
    func didTapAtNewRecipe(){
        if let _delegate = delegate {
            _delegate.didTapAtNewRecipe()
        }
    }
}
