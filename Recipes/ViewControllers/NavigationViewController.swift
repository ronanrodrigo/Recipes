//
//  NavigationViewController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 07/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController, RecipesViewControllerDelegate {

    override func viewDidLoad() {
        let controller = RecipesViewController(delegate: self)
        self.setViewControllers([controller], animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didTappedAdd() {
        NSLog("didTappedAdd")
    }

}
