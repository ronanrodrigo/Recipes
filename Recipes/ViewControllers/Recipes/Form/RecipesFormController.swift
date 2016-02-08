//
//  RecipesFormController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

protocol RecipesFormControllerDelegate {
    func saveRecipeTapped()
}

class RecipesFormController: UIViewController {
    var delegate: RecipesFormControllerDelegate?
    
    init(delegate: RecipesFormControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        self.delegate = nil
        super.init(coder: aDecoder)
    }
    
    
}
