//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0
    
    
    var time = 0
    var timer = Timer()
    
    let trivia = allQuestions
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var CorrectAnswer: UILabel!
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var timeLeft: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        
        // Correct answer is hidden while asking question.
        CorrectAnswer.isHidden = true
        
        
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        let questionDictionary = trivia[indexOfSelectedQuestion].question
        questionField.text = questionDictionary
        
        // If options are not available then buttoon is hidden.
        if(trivia[indexOfSelectedQuestion].answers["option1"] != nil) { option1.setTitle(trivia[indexOfSelectedQuestion].answers["option1"]!, for: UIControlState.normal)
        }else{ option1 .isHidden = true }
        
        if(trivia[indexOfSelectedQuestion].answers["option2"] != nil) { option2.setTitle(trivia[indexOfSelectedQuestion].answers["option2"]!, for: UIControlState.normal)
        }else{ option2.isHidden = true }
        
        if(trivia[indexOfSelectedQuestion].answers["option3"] != nil) { option3.setTitle(trivia[indexOfSelectedQuestion].answers["option3"]!, for: UIControlState.normal)
        } else{ option3.isHidden = true }
        
        if(trivia[indexOfSelectedQuestion].answers["option4"] != nil) { option4.setTitle(trivia[indexOfSelectedQuestion].answers["option4"]!, for: UIControlState.normal)
        }else{ option4.isHidden = true }
        
        
        // Time starts at 15 sec and decreases every second.
        timeLeft.text = ("15")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.showTime), userInfo: nil, repeats: true)
        
        playAgainButton.isHidden = true
    }
    
    
    
    func displayScore() {
        // Hide the answer buttons
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
        CorrectAnswer.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        CorrectAnswer.isHidden = false
        
        let correctAnswer = trivia[indexOfSelectedQuestion].correctAnswer // Change names
        
<<<<<<< HEAD
        if (sender === option1  &&  trivia[indexOfSelectedQuestion].answers["option1"]! == trivia[indexOfSelectedQuestion].correctAnswer) ||
            (sender === option2  &&  trivia[indexOfSelectedQuestion].answers["option2"]! == trivia[indexOfSelectedQuestion].correctAnswer) ||
            (sender === option3   &&  trivia[indexOfSelectedQuestion].answers["option3"]! == trivia[indexOfSelectedQuestion].correctAnswer) ||
            (sender === option4  &&  trivia[indexOfSelectedQuestion].answers["option4"]! == trivia[indexOfSelectedQuestion].correctAnswer)
        {
=======
        
        if (sender === option1  &&  trivia[indexOfSelectedQuestion].answers["option1"]! == correctAnswer) {
>>>>>>> origin/master
            correctQuestions += 1
            questionField.text = "Correct!"
        }
        else if  (sender === option2  &&  trivia[indexOfSelectedQuestion].answers["option2"]! == correctAnswer){
            correctQuestions += 1
            questionField.text = "Correct!"
        }
        else if (sender === option3   &&  trivia[indexOfSelectedQuestion].answers["option3"]! == correctAnswer){
            correctQuestions += 1
            questionField.text = "Correct!"
        }
        else if (sender === option4  &&  trivia[indexOfSelectedQuestion].answers["option4"]! == correctAnswer){
            correctQuestions += 1
            questionField.text = "Correct!"
        }
        else {
            questionField.text = "Sorry, wrong answer!"
            CorrectAnswer.text = "Correct answer is \(correctAnswer)"
        }
        
        // When user presses answer then time stops and resets.
        timer.invalidate()
        time = 0
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        option1.isHidden = false
        option2.isHidden = false
        option3.isHidden = false
        option4.isHidden = false
        CorrectAnswer.isHidden = true
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    
    // Time is decreased and displayed every second.
    func showTime() {
        time -= 1
        timeLeft.text = "\(time)"
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

