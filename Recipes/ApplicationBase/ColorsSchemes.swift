//
//  ColorsSchemes.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 16/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func primary() -> UIColor {
        return UIColor(red:1, green:0.76, blue:0.03, alpha:1)
    }
    
    class func secondary() -> UIColor {
        return UIColor(red:1, green:0.88, blue:0.51, alpha:1)
    }
    
    class func accent() -> UIColor {
        return UIColor(red:1, green:0.25, blue:0.51, alpha:1)
    }
    
    class func primaryText() -> UIColor {
        return UIColor(red:0.13, green:0.13, blue:0.13, alpha:1)
    }
    
    class func secondaryText() -> UIColor {
        return UIColor(red:0.62, green:0.62, blue:0.62, alpha:1)
    }
    
    class func background() -> UIColor {
        return UIColor(red:0.93, green:0.94, blue:0.95, alpha:1)
    }
    
}