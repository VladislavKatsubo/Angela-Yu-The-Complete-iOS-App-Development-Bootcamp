//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var percentageButtons = [UIButton]()
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanTipStack()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        cleanTipStack()
        sender.isSelected = true
        billTextField.endEditing(true)
        calculatorBrain.calculateTipValue(sender)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = calculatorBrain.getPeopleNumberString(sender)
        calculatorBrain.getPeopleNumber(sender)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateTotalAmount(totalBillField: billTextField)
        performSegue(withIdentifier: "goToResultTip", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultTip" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.totalBill = calculatorBrain.splittedBillAmount
            resultVC.tipPercentage = calculatorBrain.tipValueToPercentageString()
            resultVC.numberOfPeople = calculatorBrain.numberOfPeople
        }
    }

    func cleanTipStack() {
        percentageButtons = [zeroPcButton, tenPcButton, twentyPcButton]
        for button in percentageButtons {
            button.isSelected = false
        }
    }
    
}

