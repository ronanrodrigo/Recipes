//
//  IngredientsFormTableViewDataSource.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 02/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class IngredientsFormTableViewDataSource: NSObject, UITableViewDataSource {
    var recipe: Recipe?
    var fieldsCellIdentifier: String
    
    var title: UITextField!
    var quantity: UITextField!
    var measureUnity: UITextField!
    var fields: [UITextField]!

    init(recipe: Recipe?, fieldsCellIdentifier: String) {
        self.recipe = recipe
        self.fieldsCellIdentifier = fieldsCellIdentifier
        
        super.init()

        configureFields()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!

        cell = tableView.dequeueReusableCellWithIdentifier(fieldsCellIdentifier, forIndexPath: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        fields(forIndexPath: indexPath, at: cell)

        return cell
    }
    
    func configureFields() {
        title = UITextField()
        title.placeholder = "Title"
        
        quantity = UITextField()
        quantity.placeholder = "Quantity"
        
        measureUnity = UITextField()
        measureUnity.placeholder = "Measure Unity"
        
        fields = [title, quantity, measureUnity]
    }
    
    func fields(forIndexPath indexPath: NSIndexPath, at cell: UITableViewCell) {
        let textField = fields[indexPath.row]
        textField.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(textField)
        cell.addConstraints(textField.stretchToHeightOfSuperView(0))
        cell.addConstraints(textField.stretchToWidthOfSuperView(15))
    }
}