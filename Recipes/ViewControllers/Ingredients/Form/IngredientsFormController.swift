//
//  IngredientsFormController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 19/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class IngredientsFormController: UIViewController {
    var label: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        label = UILabel(frame: view.frame)
        label.text = "Hello"
        view.addSubview(label)
    }
    
}
