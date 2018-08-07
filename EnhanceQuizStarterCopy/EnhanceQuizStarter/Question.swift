//
//  QuestionBank.swift
//  EnhanceQuizStarter
//
//  Created by Peter Reichl on 7/23/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

struct Question {
    
    let questionText: String
    let answerA: String
    let answerB: String
    let answerC: String
    let answerD: String
    let correctAnswer: Int
    let correctText: String
    
    init(questionText: String, answerA: String, answerB: String, answerC: String, answerD: String, correctAnswer: Int, correctText: String) {
        self.questionText = questionText
        self.answerA = answerA
        self.answerB = answerB
        self.answerC = answerC
        self.answerD = answerD
        self.correctAnswer = correctAnswer
        self.correctText = correctText
    }
    
    
    
}
