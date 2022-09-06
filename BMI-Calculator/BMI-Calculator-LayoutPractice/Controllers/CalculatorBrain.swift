//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Vlad Katsubo on 6.09.22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.2f", bmi?.value ?? "0.0")
    }
    
    mutating func calculateBMI(weight: Float, height: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
        }
        
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Just run every day."
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
}

