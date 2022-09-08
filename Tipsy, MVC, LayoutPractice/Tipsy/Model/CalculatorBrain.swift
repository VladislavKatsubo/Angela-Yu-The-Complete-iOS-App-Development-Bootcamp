//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Vlad Katsubo on 8.09.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var tipValue: Float = 0.0
    var numberOfPeople = 0
    var totalBill: Float = 0.0
    var splittedBillAmount: String = "0"
    
    
    mutating func calculateTipValue(_ button: UIButton) {
        guard let tipButtonTextValue = button.currentTitle else { return }
        guard let stringNumbers = Float(tipButtonTextValue.dropLast()) else { return }
        tipValue = stringNumbers / 100
    }
    
    mutating func getPeopleNumber(_ stepper: UIStepper) {
        numberOfPeople = Int(stepper.value)
    }
    
    func getPeopleNumberString(_ stepper: UIStepper) -> String {
        return String(Int(stepper.value))
    }
    
    func tipValueToPercentageString() -> String {
        return String(Int(tipValue * 100)) + "%"
    }
    
    mutating func calculateTotalAmount(totalBillField: UITextField) {
        guard let totallBillText = totalBillField.text else { return }
        guard let totalBillFloat = Float(totallBillText) else { return }
        totalBill = totalBillFloat
        splittedBillAmount = String(format: "%.2f", (totalBill * (1 + tipValue)) / Float(numberOfPeople))
    }
}
