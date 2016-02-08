//
//  RecipesTablewViewDelegate.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesListDelegate: NSObject, UITableViewDelegate {
  func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    NSLog("willDisplayCell %d %d", indexPath.row, indexPath.section)
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    NSLog("didSelectRowAtIndexPath %d %d", indexPath.row, indexPath.section)
  }
}