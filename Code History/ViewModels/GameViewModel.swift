//
//  GameViewModel.swift
//  Code History
//
//  Created by Alice Jin on 2023-07-11.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
  // MARK: - Published properties
  @Published private var game = Game()
    
  // MARK: - Internal properties
  var currentQuestion: Question {
     game.currentQuestion
  }
    
  var questionProgressText: String {
    "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
  }

    var correctGuesses: Int {
      game.guessCount.correct
    }
   
    var incorrectGuesses: Int {
      game.guessCount.incorrect
    }
    
    var guessWasMade: Bool {
        if let _ = game.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    
    var gameIsOver: Bool {
      game.isOver
    }
    
    func makeGuess(atIndex index: Int) {
        game.makeGuessesForCurrentQuestion(atIndex: index)
    }
    
    func displayNextScreen() {
        game.updateGameStatus()
    }
    
    func color(forOptionIndex optionIndex: Int) -> Color {
           if let guessedIndex = game.guesses[currentQuestion] {
               if guessedIndex != optionIndex {
                   return GameColor.main
               } else if guessedIndex == currentQuestion.correctAnswerIndex {
                   return GameColor.correctGuess
               } else {
                   return GameColor.incorrectGuess
               }
           } else {
               return GameColor.main
           }
       }
}
