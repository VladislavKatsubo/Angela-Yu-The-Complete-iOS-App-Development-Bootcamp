//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var counter: Int?
    var timer = Timer()
    var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "How do your like your eggs?"
        progressBar.progress = 0.0
    }
    
    @IBAction func reset(_ sender: UIButton) {
        resetTimer()
        textLabel.text = "How do your like your eggs?"
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let hardness = sender.currentTitle else { return }
        guard let timeToBoil = eggTimes[hardness] else { return }
        resetTimer()
        counter = timeToBoil
        
        
        if let counter = counter {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
                if secondsPassed < counter {
                    secondsPassed += 1
                    progressBar.progress = Float(secondsPassed) / Float(counter)
                    textLabel.text = "You've chosen \(hardness) egg. Please wait for \(counter - secondsPassed + 1)s"
                   } else {
                       Timer.invalidate()
                       playSound()
                       textLabel.text = "Egg is Done!"
                   }
               }
        }
        
        
    }
    
    func resetTimer() {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
    }
    
    

    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
