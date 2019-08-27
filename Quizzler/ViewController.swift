//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let questionBank = QuestionBank()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(answer: sender.tag)
        nextQuestion()
    }
    
    
    func updateUI() {
        questionLabel.text = questionBank.getQuestion()
        scoreLabel.text = "Score: \(questionBank.totalScore)"
        progressLabel.text = "\(questionBank.questionIndex + 1)/\(questionBank.list.count)"
        progressBar.frame = CGRect(x: 0, y: progressBar.frame.minY, width: (UIScreen.main.bounds.width / CGFloat(questionBank.list.count)) * CGFloat(questionBank.questionIndex + 1), height: progressBar.frame.height)
    }
    

    func nextQuestion() {
        if !questionBank.isLastQuestion() {
            questionBank.nextQuestion()
            updateUI()
        } else {
            showAlert()
        }
    }
    
    
    func checkAnswer(answer: Int) {
        if questionBank.isCorrectAnswer(answer: answer == 1) {
            ProgressHUD.showSuccess("Correct")
        } else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        questionBank.reset()
        updateUI()
    }
    
    func showAlert() {
        let alert = UIAlertController.init(title: "Awesome", message: "You've finished all the questions, do you want start over?", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.startOver()
        })
        alert.addAction(restartAction)
        self.present(alert, animated: true, completion: nil)
    }

    
}
