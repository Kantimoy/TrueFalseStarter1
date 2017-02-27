//
//  AppQuestions.swift
//  TrueFalseStarter
//
//  Created by Kantimoy SUR on 2/26/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Questions {
    
    var question: String
    var answers: [String:String]
    var correctAnswer: String
    
    init(question: String, answer: [String:String], correctAnswer: String){
        
        self.question = question
        self.answers = answer
        self.correctAnswer = correctAnswer
    }
    
}







let allQuestions: [Questions] = [Questions(question: "This was the only US President to serve more than two consecutive terms.", answer: ["option1": "George Washington", "option2": "Franklin D. Roosevelt", "option3": "Woodrow Wilson", "option4": "Andrew Jackson"], correctAnswer: "Franklin D. Roosevelt"),
Questions(question: "Which of the following countries has the most residents?", answer: ["option1": "Nigeria", "option2": "Russia", "option3": "Iran", "option4": "Vietnam"], correctAnswer: "Russia"),
Questions(question: "In what year was the United Nations founded?", answer: ["option1": "1918", "option2": "1919", "option3": "1945", "option4": "1954"], correctAnswer: "1945"),
Questions(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", answer: ["option1": "Paris", "option2": "Washington D.C.", "option3": "New York City", "option4": "Boston"], correctAnswer: "New York City"),
Questions(question: "Only female koalas can whistle", answer: ["option1": "True", "option2": "False"], correctAnswer: "False"),
Questions(question: "Blue whales are technically whales", answer: ["option1": "True", "option2": "False"], correctAnswer: "True"),
Questions(question: "Camels are cannibalistic", answer: ["option1": "True", "option2": "False"], correctAnswer: "False"),
Questions(question: "All ducks are birds", answer: ["option1": "True", "option2": "False"], correctAnswer: "True"),]





