//
//  Step.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

protocol Step {
    var sequence: Int { get }
    var description: String { get }
}

struct StepStruct: Step {
    var sequence: Int
    var description: String
}