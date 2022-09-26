//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Vlad Katsubo on 25.09.22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculationLogic {
    
    private var number: Double?
    
    private var intermidiateCalculation: (firstNumber: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(_ symbol: String) -> Double? {
        if let n = number {
            if symbol == "AC" {
                return 0
            } else if symbol == "+/-" {
                return n * -1
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "=" {
                return performTwoCalculation(n2: n)
            } else {
                intermidiateCalculation = (firstNumber: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoCalculation(n2 numberTwo: Double) -> Double? {
        if let numberOne = intermidiateCalculation?.firstNumber, let operation = intermidiateCalculation?.calcMethod {
            switch operation {
            case "÷":
                return numberOne / numberTwo
            case "×":
                return numberOne * numberTwo
            case "-":
                return numberOne - numberTwo
            case "+":
                return numberOne + numberTwo
            default:
            print("Unknow operation")
            }
            
        }
        return nil
    }
    
}
