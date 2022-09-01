//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var counter: Int?
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "How do your like your eggs?"
        progressBar.progress = 0.0
    }
    
    // egg pressed
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        counter = eggTimes[sender.currentTitle!]
        
        
        var maxNumber = counter
        var currentNumber = 0
        var progressNumber: Float = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if counter ?? 60 > 0 {
                currentNumber = counter!
                progressNumber = Float(currentNumber) / Float(maxNumber!)
                textLabel.text = "You should wait for \(counter!) seconds"
                print ("\(String(describing: counter ?? 60)) seconds")
                counter! -= 1
                progressBar.progress = abs(progressNumber - 1.0)
                
               } else {
                   Timer.invalidate()
                   progressBar.progress = 1
                   textLabel.text = "Egg is Done!"
               }
           }
        
//        func progressBarFraction(_ currentNumber: Int, _ maxNumber: Int) {
//            number /
//        }
        
    }
    
    
}
