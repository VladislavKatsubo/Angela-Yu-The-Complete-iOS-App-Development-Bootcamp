//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    
    var choiceButtons = [UIButton]()
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceButtons.append(contentsOf: [firstChoice, secondChoice, thirdChoice])
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            buttonColor(UIColor.green, sender: sender)
        } else {
            buttonColor(UIColor.red, sender: sender)
        }
        
        quizBrain.nextQuestion()
        updateUI()
    }
    
    func updateUI() {
        let answersArray = quizBrain.getAnswersArray()
        for (index, button) in choiceButtons.enumerated() {
            button.setTitle(answersArray[index], for: .normal)
        }
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = quizBrain.getScore()
        questionLabel.text = quizBrain.getQuestionText()
    }
    
    func buttonColor(_ color: UIColor, sender: UIButton) {
        sender.backgroundColor = color
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            sender.backgroundColor = nil
        }
    }
    
}

