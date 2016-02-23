//
//  RecipesFormDataSource.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesFormDataSource: NSObject, UITableViewDataSource {
    var cellIdentifier: String
    var recipeFields: [UITextField]!
    var recipeTitle: UITextField!
    var recipeDescription: UITextField!
    var recipe: Recipe?
    
    init(cellIdentifier: String, recipe: Recipe?) {
        self.cellIdentifier = cellIdentifier
        self.recipe = recipe
        super.init()
        createRecipeFields()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Recipe infos"
        }
        return ""
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeFields.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        recipeField(indexPath, cell: cell)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func createRecipeFields() {
        self.recipeTitle = UITextField()
        self.recipeTitle.placeholder = "Title"
        
        self.recipeDescription = UITextField()
        self.recipeDescription.placeholder = "Description"
        
        if let recipe = self.recipe {
            self.recipeTitle.text = recipe.title
            self.recipeDescription.text = recipe.brief
        }
        
        self.recipeFields = [self.recipeTitle, self.recipeDescription]
    }
    
    func recipeField(indexPath: NSIndexPath, cell: UITableViewCell) {
        let textField = recipeFields[indexPath.row]
        textField.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(textField)
        cell.addConstraints(textField.stretchToHeightOfSuperView(0))
        cell.addConstraints(textField.stretchToWidthOfSuperView(15))
    }
}