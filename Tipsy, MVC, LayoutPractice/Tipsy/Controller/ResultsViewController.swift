//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Vlad Katsubo on 7.09.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalBill: String?
    var tipPercentage: String?
    var numberOfPeople: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let totalBill = totalBill {
            totalLabel.text = totalBill
        }
        
        if let tipPercentage = tipPercentage {
            if let numberOfPeople = numberOfPeople {
                settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage) tip."
            }
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
}
