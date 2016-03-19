//
//  RecipesFormDataSource.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesFormTableViewDataSource: NSObject, UITableViewDataSource {
    var recipeFields: [UITextField]!
    var recipeTitle: UITextField!
    var recipeDescription: UITextField!
    var recipe: Recipe?
    var fieldsCellIdentifier: String
    var ingredientsCellIdentifier: String
    var stepsCellIdentifier: String
    
    let fieldsSection = 0
    let ingredientsSection = 1
    let stepsSection = 2
    
    init(recipe: Recipe?, fieldsCellIdentifier: String, ingredientsCellIdentifier: String, stepsCellIdentifier: String) {
        self.recipe = recipe
        self.fieldsCellIdentifier = fieldsCellIdentifier
        self.ingredientsCellIdentifier = ingredientsCellIdentifier
        self.stepsCellIdentifier = stepsCellIdentifier
        
        super.init()
        
        createRecipeFields()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case fieldsSection: return "Recipe infos"
        case ingredientsSection: return "Ingredients"
        case stepsSection: return "Steps"
        default: return ""
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case fieldsSection: return recipeFields.count
        case ingredientsSection: return 1
        case stepsSection: return 1
        default: return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        switch indexPath.section {
        case fieldsSection:
            cell = tableView.dequeueReusableCellWithIdentifier(fieldsCellIdentifier, forIndexPath: indexPath)
            recipeField(indexPath, cell: cell)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
        case ingredientsSection:
            cell = tableView.dequeueReusableCellWithIdentifier(ingredientsCellIdentifier, forIndexPath: indexPath)
            recipeIngredientsCell(cell)
        default:
            cell = tableView.dequeueReusableCellWithIdentifier(stepsCellIdentifier, forIndexPath: indexPath)
            recipeStepsCell(cell)
        }
        
        return cell
    }
    
    func createRecipeFields() {
        recipeTitle = UITextField()
        recipeTitle.placeholder = "Title"
        
        recipeDescription = UITextField()
        recipeDescription.placeholder = "Description"
        
        if let _recipe = recipe {
            recipeTitle.text = _recipe.title
            recipeDescription.text = _recipe.brief
        }
        
        recipeFields = [recipeTitle, recipeDescription]
    }
    
    func recipeField(indexPath: NSIndexPath, cell: UITableViewCell) {
        let textField = recipeFields[indexPath.row]
        textField.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(textField)
        cell.addConstraints(textField.stretchToHeightOfSuperView(0))
        cell.addConstraints(textField.stretchToWidthOfSuperView(15))
    }
    
    func recipeIngredientsCell(cell: UITableViewCell) {
        disclosureIndicatorCell(cell, text: "Add ingredients")
    }
    
    func recipeStepsCell(cell: UITableViewCell) {
        disclosureIndicatorCell(cell, text: "Add steps")
    }
    
    func disclosureIndicatorCell(cell: UITableViewCell, text: String) {
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.secondaryText()
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    }
}