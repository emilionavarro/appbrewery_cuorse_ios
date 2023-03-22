//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Emilio Navarro on 3/21/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi:Float = 0.0
    var advice: String = ""
    var color: UIColor = .blue
    
    init() {
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        self.bmi = weight / pow(height, 2)
        
        if bmi < 18.5 {
            advice = "underweight"
            color = .green
        } else if bmi < 24.9 {
            advice = "normal"
            color = .blue
        } else {
            advice = "overweight"
            color = .orange
        }
    }
}
