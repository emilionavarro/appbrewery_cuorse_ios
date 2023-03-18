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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = Dictionary(uniqueKeysWithValues: [Question(text: "4+2=6", answer: true),
        Question(text: "5-3 > 1", answer: true),
        Question(text: "3+8 < 10", answer: false)].map { ($0.text, $0.answer) })
    var score: Int = 0
    var progress: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let firstQuestion = quiz.randomElement() else { return }
        questionLabel.text = firstQuestion.key
        
        progressBar.progress = progress
        
    }
    
    func endGame() {
        print("end game")
        questionLabel.text = "You scored \(score)/3! Try again?"
        trueButton.titleLabel?.text = "Yes"
        falseButton.titleLabel?.text = "No"
        trueButton.setTitle("Yes", for: .normal)
        falseButton.setTitle("No", for: .normal)
    }
    
    func resetGame() {
        print("resettting game")
        guard let firstQuestion = quiz.randomElement() else { return }
        questionLabel.text = firstQuestion.key
        progress = 0.0
        score = 0
        trueButton.titleLabel?.text = "True"
        falseButton.titleLabel?.text = "False"
        trueButton.setTitle("True", for: .normal)
        falseButton.setTitle("False", for: .normal)
        progressBar.progress = progress
    }
    
    func correct() {
        progress += 0.3
        score += 1
        progressBar.progress = progress
        self.questionLabel.text = "Correct!"
        
        if (progress >= 0.9) {
            progress = 1.0
            progressBar.progress = progress
            endGame()
        } else {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
                guard let firstQuestion = self.quiz.randomElement() else { return }
                self.questionLabel.text = firstQuestion.key
            })
        }
        
    }
    
    func incorrect() {
        progress += 0.3
        progressBar.progress = progress
        questionLabel.text = "Incorrect!"
        if (progress >= 0.9) {
            progress = 1.0
            progressBar.progress = progress
            endGame()
        } else {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
                guard let firstQuestion = self.quiz.randomElement() else { return }
                self.questionLabel.text = firstQuestion.key
            })
        }
        
    }
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if (progress == 1.0 && sender.titleLabel?.text == "Yes") {
            resetGame()
            return
        } else if (progress == 1.0) {
            return
        } else if (questionLabel.text == "Correct!" || questionLabel.text == "Incorrect!") {
            return
        }
        
        guard let questionKey: String = questionLabel.text else { return }
        let actualAnswer: Bool = self.quiz[questionKey]!
        print("title label \(sender.titleLabel?.text ?? "")")
        
        if (sender.titleLabel?.text == "True") {
            if (actualAnswer) {
                correct()
            } else {
                incorrect()
            }
        } else {
            if (!actualAnswer) {
                correct()
            } else {
                incorrect()
            }
        }
    }
    
}

