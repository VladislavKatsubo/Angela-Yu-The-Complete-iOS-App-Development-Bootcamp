//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    private var displayValue: Double {
        get {
            guard let displayValueString = displayLabel.text else { fatalError("no value to convert") }
            guard let displayValueDouble = Double(displayValueString) else { fatalError("no value to convert")}
            return displayValueDouble
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculatorLogic = CalculationLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTyping = true
        calculatorLogic.setNumber(displayValue)
        guard let calcValue = sender.currentTitle else { return }
        print(calcValue)
        guard let result = calculatorLogic.calculate(calcValue) else { return }
        print(calcValue)
        displayValue = result
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        guard let numValue = sender.currentTitle else { return }
        if isFinishedTyping {
            displayLabel.text = numValue
            isFinishedTyping = false
        } else {
            if numValue == "." {
                let isInt = floor(displayValue) == displayValue
                if !isInt {
                    return
                }
            }
            displayLabel.text = displayLabel.text! + numValue
        }
    }
    
}

