//
//  UIViewAutoLayoutExtension.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

extension UIView {
  func stretchToHeightOfSuperView(padding: CGFloat) -> [NSLayoutConstraint] {
    let constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-padding-[item]-padding-|", options: .AlignAllCenterY, metrics: ["padding" : padding], views: ["item" : self])
    self.superview?.addConstraints(constraints)
    return constraints
  }
  
  func stretchToWidthOfSuperView(padding: CGFloat) -> [NSLayoutConstraint] {
    let constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-padding-[item]-padding-|", options: .AlignAllCenterX, metrics: ["padding" : padding], views: ["item" : self])
    self.superview?.addConstraints(constraints)
    return constraints
  }
  
  func alignTopTo(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
    let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: padding)
    self.superview?.addConstraint(constraint)
    return [constraint]
  }
  
  func centerHorizontallyTo(toItem: UIView) -> [NSLayoutConstraint] {
    return self.centerHorizontallyTo(toItem, padding: 0)
  }
  
  func centerHorizontallyTo(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
    let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: padding)
    self.superview?.addConstraint(constraint)
    return [constraint]
  }
  
  func centerVerticallyTo(toItem: UIView) -> [NSLayoutConstraint] {
    return self.centerVerticallyTo(toItem, padding: 0)
  }
  
  func centerVerticallyTo(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
    let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: padding)
    self.superview?.addConstraint(constraint)
    return [constraint]
  }
  
  func constrainWidthTo(toItem: UIView) -> [NSLayoutConstraint] {
    let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0)
    self.superview?.addConstraint(constraint)
    return [constraint]
  }
  
  func constrainHeightTo(toItem: UIView) -> [NSLayoutConstraint] {
    let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0)
    self.superview?.addConstraint(constraint)
    return [constraint]
  }
  
  func anchorToBottom(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
    let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: padding)
    
    self.superview?.addConstraint(constraint)
    return [constraint]
  }
  
  func anchorToRight(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
    let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: padding)
    
    self.superview?.addConstraint(constraint)
    return [constraint]
  }
  
  func anchorToTop(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
    let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: -padding)
    
    self.superview?.addConstraint(constraint)
    return [constraint]
  }
  func anchorToLeft(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
    let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Left , multiplier: 1.0, constant: -padding)
    
    self.superview?.addConstraint(constraint)
    return [constraint]
  }
}