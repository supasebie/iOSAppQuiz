//
//  Game.swift
//  CodeHistoryQuiz
//
//  Created by Sebastian on 5/18/24.
//

import Foundation

struct Game {
    private(set) var attempts = [Question: Int]()
    private(set) var currentQuestionIndex = 0
    private(set) var isOver = false
    private let questions = Question.allQuestions.shuffled()

    mutating func makeAttemptAtCurrentQuestion(_ index: Int) -> Void {
        attempts[currentQuestion] = index
    }
    
    mutating func updateGameStatus() {
        if currentQuestionIndex < questions.count {
            currentQuestionIndex += 1
        } else {
            isOver = true;
        }
    }
    
    var numberOfQuestions: Int {
        questions.count
    }
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    var attemptCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0,0)
        for (question, attemptIndex) in attempts {
            if question.correctAnswerIndex == attemptIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }
}
