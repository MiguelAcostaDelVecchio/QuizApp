//
//  questions.swift
//  SwiftUIQuiz
//
//  Created by Miguel Acosta Del Vecchio on 9/21/23.
//

import Foundation

struct Question: Hashable {
    let questionText: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
    
    static var allQuestions = [
        Question(questionText: "What is the capital of Italy?",
                possibleAnswers: ["Rome", "Madrid", "Paris", "Munich"],
                correctAnswerIndex: 0),
        Question(questionText: "Who is the GOAT in soccer?",
                 possibleAnswers: ["Pele", "Maradona", "CR7", "Messi"],
                 correctAnswerIndex: 3),
        Question(questionText: "What is the best soccer team in the world?",
                 possibleAnswers: ["Barcelona", "Real Madrid", "Bayern Munich", "AC Milan"],
                 correctAnswerIndex: 3),
        Question(questionText: "What was the first computer bug?", possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
                 correctAnswerIndex: 2)]
    
    
}
