//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            buttonColor(UIColor.green, sender: sender)
        } else {
            buttonColor(UIColor.red, sender: sender)
        }
        
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
            updateUI()
        } else if questionNumber == quiz.count - 1 {
            questionNumber = 0
            updateUI()
        }
    }
    
    func updateUI() {
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
        questionLabel.text = quiz[questionNumber].text
    }
    
    func buttonColor(_ color: UIColor, sender: UIButton) {
        sender.backgroundColor = color
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            sender.backgroundColor = nil
        }
    }
    
}

