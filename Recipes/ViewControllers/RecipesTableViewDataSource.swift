//
//  RecipesTableViewDataSource.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 07/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesTableViewDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}