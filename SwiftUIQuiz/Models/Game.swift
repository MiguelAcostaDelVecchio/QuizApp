//
//  Game.swift
//  SwiftUIQuiz
//
//  Created by Miguel Acosta Del Vecchio on 9/23/23.
//

import Foundation

struct Game {
    private (set) var currentQuestionIndex = 0
    private (set) var guesses = [Question: Int]()
    private (set) var lastQuestion = false
    private let questions = Question.allQuestions.shuffled()
    var numberOfQuestions: Int {
        return questions.count
    }
    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0, 0)
        for (question, guessedIndex) in guesses {
            if question.correctAnswerIndex == guessedIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }
    var currentQuestion: Question {
        return questions[currentQuestionIndex]
    }
    
    mutating func makeGuessForCurrentQuestion(atIndex index: Int) {
        guesses[currentQuestion] = index
    }
    
    mutating func updateGameStatus () {
        if currentQuestionIndex < numberOfQuestions - 1 {
            currentQuestionIndex += 1
            if currentQuestionIndex == numberOfQuestions - 1 {
                lastQuestion = true
            }
        }
    }
    
    
}
