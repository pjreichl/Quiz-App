    //
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
  //Create outlets for UI
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerStatusLabel: UILabel!
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    @IBOutlet weak var gameSummaryLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    // MARK: - Properties
    let trivia = AllQuestions()
    var questionNumber: Int = AllQuestions().randomQuestion()
    var correctAnswer: Int = 0
    var correctText: String = ""
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion = 0
    
    var gameSound: SystemSoundID = 0
    
    var timer = Timer()
    
   
    func updateQuestion() {
        
        gameSummaryLabel.isHidden = true
        questionLabel.text = trivia.list[questionNumber].questionText
        answerAButton.setTitle(trivia.list[questionNumber].answerA, for: UIControlState.normal)
        answerBButton.setTitle(trivia.list[questionNumber].answerB, for: UIControlState.normal)
        answerCButton.setTitle(trivia.list[questionNumber].answerC, for: UIControlState.normal)
        answerDButton.setTitle(trivia.list[questionNumber].answerD, for: UIControlState.normal)
        correctAnswer = trivia.list[questionNumber].correctAnswer
        correctText = trivia.list[questionNumber].correctText
        questionNumber = AllQuestions().randomQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameStartSound()
        playGameStartSound()
        updateQuestion()
        
        answerAButton.isHidden = false
        answerBButton.isHidden = false
        answerCButton.isHidden = false
        answerDButton.isHidden = false
        playAgainButton.isHidden = true
        
    }
    
    // MARK: - Helpers
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func correctAnswerSound() {
        let path = Bundle.main.path(forResource: "Bing-sound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func incorrectAnswerSound() {
        let path = Bundle.main.path(forResource: "buzzer", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)    }
    
    
    func displayScore() {
        // Hide the answer uttons
        gameSummaryLabel.isHidden = false
        answerAButton.isHidden = true
        answerBButton.isHidden = true
        answerCButton.isHidden = true
        answerDButton.isHidden = true
        answerStatusLabel.isHidden = false
        
        // Display play again button
        playAgainButton.isHidden = false
        
        gameSummaryLabel.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            updateQuestion()
        }
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    
    
    
    // MARK: - Outlets
    
    
    @IBAction func answerButtonPressed(_ sender: Any) {
        if (sender as AnyObject).tag == correctAnswer {
            correctAnswerSound()
            playGameStartSound()
            print("Correct!")
            answerStatusLabel.isHidden = false
            answerStatusLabel.text = "Correct!"
            answerStatusLabel.textColor = UIColor.green
            correctQuestions += 1
        } else {
            incorrectAnswerSound()
            playGameStartSound()
            answerStatusLabel.isHidden = false
            answerStatusLabel.text = "Wrong Answer. The Correct answer is \(correctText)."
            answerStatusLabel.textColor = UIColor.red
          print("Wrong Answer!")
        }
        questionsAsked += 1
        nextRound()
    }
    
   
    
    // MARK: - Actions
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Show the answer buttons
        answerAButton.isHidden = false
        answerBButton.isHidden = false
        answerCButton.isHidden = false
        answerDButton.isHidden = false
        answerStatusLabel.isHidden = true
        
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

}

