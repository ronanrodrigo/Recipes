//
//  RecipesFormDelegate.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 19/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesFormTableViewDelegate: NSObject, UITableViewDelegate {
    var delegate: RecipesFormControllerDelegate
    
    init(delegate: RecipesFormControllerDelegate) {
        self.delegate = delegate
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate.didTapeedAtAddIngredients()
    }
}