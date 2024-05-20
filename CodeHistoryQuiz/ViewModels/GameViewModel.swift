//
//  GameViewModel.swift
//  CodeHistoryQuiz
//
//  Created by Sebastian on 5/19/24.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published private var game  = Game()
    
    var attemptWasMade: Bool {
        if let _ = game.attempts[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    
    func makeAttempt(_ atAnswerIndex: Int) {
        game.makeAttemptAtCurrentQuestion(atAnswerIndex)
    }
    
    func displayNextScreen() {
        game.updateGameStatus()
    }
    
    func color(_ forOptionIndex: Int) -> Color {
        if let attemptIndex = game.attempts[currentQuestion] {
            if attemptIndex != forOptionIndex {
                return GameColor.main
            } else if attemptIndex == currentQuestion.correctAnswerIndex {
                return GameColor.correct
            } else {
                return GameColor.incorrect
            }
        } else {
            return GameColor.main
        }
    }   
    
    var currentQuestion: Question {
        game.currentQuestion
    }
    
    var questionProgressText: String {
        "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
    }
    
}
