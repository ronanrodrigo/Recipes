//
//  IntEnumTests.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 12/03/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class IntEnumTests: XCTestCase {
    
    func testShouldReturnEasyWhenZero() {
        let easyInt = 0
        
        let dificultyLevel = easyInt.toDificultyLevel()
        
        XCTAssertEqual(dificultyLevel, DificultyLevel.Easy)
    }
    
    func testShouldReturnMediumWhenOne() {
        let mediumInt = 1
        
        let dificultyLevel = mediumInt.toDificultyLevel()
        
        XCTAssertEqual(dificultyLevel, DificultyLevel.Medium)
    }
    
    func testShouldReturnHardWhenTwo() {
        let hardInt = 2
        
        let dificultyLevel = hardInt.toDificultyLevel()
        
        XCTAssertEqual(dificultyLevel, DificultyLevel.Hard)
    }
    
    func testShouldReturnEasyWhenOtherValue() {
        let otherInt = 123
        
        let dificultyLevel = otherInt.toDificultyLevel()
        
        XCTAssertEqual(dificultyLevel, DificultyLevel.Easy)
    }
    
}
