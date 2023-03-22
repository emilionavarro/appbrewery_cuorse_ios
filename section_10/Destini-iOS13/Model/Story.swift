//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    var description = ""
    var choice1 = ""
    var choice2 = ""
    
    init(description: String, choice1: String, choice2: String){
        self.description = description
        self.choice1 = choice1
        self.choice2 = choice2
    }
}
