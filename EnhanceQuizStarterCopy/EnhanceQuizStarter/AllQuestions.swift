//
//  QuestionBank.swift
//  EnhanceQuizStarter
//
//  Created by Peter Reichl on 7/23/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import GameKit

class AllQuestions {
    

    var list = [Question]()
    
    init() {
        list.append(Question(questionText: "Which of these bands had Eric Clapton as a member?", answerA: "Blind Faith", answerB: "Cream", answerC: "Derek and the Dominoes", answerD: "All of the Above", correctAnswer: 4, correctText: "All of the Above"))
        
        list.append(Question(questionText: "Who is the lead singer of Panic at the Disco?", answerA: "Ryan Tedder", answerB: "Billy Joe Armstrong", answerC: "Patrick Stump", answerD: "Brendon Urie", correctAnswer: 4, correctText: "Brendon Urie"))
        
        list.append(Question(questionText: "Who founded the Lollapalooza music festival?", answerA: "Eddie Vedder", answerB: "Anthony Kiedis", answerC: "Perry Farrell", answerD: "Sting", correctAnswer: 3, correctText: "Perry Farrell"))
        
        list.append(Question(questionText: "The band The Foo Fighters was formed with two members from which band?", answerA: "Red Hot Chili Peppers", answerB: "Soundgarden", answerC: "Alice In Chains", answerD: "Nirvana", correctAnswer: 4, correctText: "Nirvana"))
        
        list.append(Question(questionText: "Which actor is in the band 30 Seconds to Mars?", answerA: "Johnny Depp", answerB: "Jared Leto", answerC: "Keanu Reeves", answerD: "Juliette Lewis", correctAnswer: 2, correctText: "Jared Leto"))
        
        list.append(Question(questionText: "Which band name was borrowed from a Simpsons episode?", answerA: "Fall Out Boy", answerB: "Green Day", answerC: "21 Pilots", answerD: "Limp Bizkit", correctAnswer: 1, correctText: "Fall Out Boy"))
        
        list.append(Question(questionText: "The 1980s charity concert Live Aid was held in which American city?", answerA: "New York", answerB: "Nashville", answerC: "Philadelphia", answerD: "Los Angeles", correctAnswer: 3, correctText: "Philadelphia"))
        
        list.append(Question(questionText: "Which city is home to the Rock and Roll Hall of Fame?", answerA: "Memphis", answerB: "Cleveland", answerC: "New York", answerD: "Austin", correctAnswer: 2, correctText: "Cleveland"))
        
        list.append(Question(questionText: "Which of these bands was not part of the Seattle grunge scene?", answerA: "Stone Temple Pilots", answerB: "Pearl Jam", answerC: "Screaming Trees", answerD: "Alice In Chains", correctAnswer: 1, correctText: "Stone Temple Pilots"))
        
        list.append(Question(questionText: "Which of these bands features two guitar playing brothers?", answerA: "The Kinks", answerB: "The Allman Brothers", answerC: "Aerosmith", answerD: "The Yardbirds", correctAnswer: 1, correctText: "The Kinks"))
        
        list.append(Question(questionText: "Who wrote the song \"Red, Red Wine\"?", answerA: "Neil Diamond", answerB: "Neil Peart", answerC: "Neil Young", answerD: "Neil Sedaka", correctAnswer: 1, correctText: "Neil Diamond"))
        
        list.append(Question(questionText: "Who was not a member of the Beach Boys?", answerA: "Brian Wilson", answerB: "Jackie Wilson", answerC: "Dennis Wilson", answerD: "Carl Wilson", correctAnswer: 2, correctText: "Jackie Wilson"))
        
    }
    
    func randomQuestion() -> Int {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: list.count)
        return randomNumber
    }
}
