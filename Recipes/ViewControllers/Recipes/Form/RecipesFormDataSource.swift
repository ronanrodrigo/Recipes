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
    var recipeFields: [UITextField]!
    var recipeTitle: UITextField!
    var recipeDescription: UITextField!
    var recipe: Recipe?
    var recipesFieldsCellIdentifier: String
    var recipesIngredientsCellIdentifier: String
    
    let recipeFieldsSection = 0
    let recipeIngredientsSection = 1
    
    init(recipe: Recipe?, recipesFieldsCellIdentifier: String, recipesIngredientsCellIdentifier: String) {
        self.recipe = recipe
        self.recipesFieldsCellIdentifier = recipesFieldsCellIdentifier
        self.recipesIngredientsCellIdentifier = recipesIngredientsCellIdentifier
        
        super.init()
        
        createRecipeFields()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case recipeFieldsSection: return "Recipe infos"
        case recipeIngredientsSection: return "Ingredients"
        default: return ""
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case recipeFieldsSection: return recipeFields.count
        case recipeIngredientsSection: return 1
        default: return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if indexPath.section == recipeFieldsSection {
            cell = tableView.dequeueReusableCellWithIdentifier(recipesFieldsCellIdentifier, forIndexPath: indexPath)
            recipeField(indexPath, cell: cell)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(recipesIngredientsCellIdentifier, forIndexPath: indexPath)
            recipeIngredientsCell(cell)
        }
        
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
    
    func recipeIngredientsCell(cell: UITableViewCell) {
        cell.textLabel?.text = "Add ingredients"
        cell.textLabel?.textColor = UIColor.secondaryText()
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    }
}