//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightValue)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weightValue = Int(sender.value)
        weightLabel.text = "\(weightValue)kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        print(weightSlider.value / (heightSlider.value * heightSlider.value))
    }
    
    
    
    
}

