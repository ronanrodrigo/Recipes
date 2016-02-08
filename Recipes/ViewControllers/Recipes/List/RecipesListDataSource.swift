//
//  RecipesTableViewDataSource.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesListDataSource: NSObject, UITableViewDataSource {
    var recipes: [String]
    var cellIdentifier: String
    
    init(recipes: [String], cellIdentifier: String) {
        self.recipes = recipes
        self.cellIdentifier = cellIdentifier
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = recipes[indexPath.row]
        return cell
    }
}