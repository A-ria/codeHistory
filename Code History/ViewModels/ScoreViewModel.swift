//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Alice Jin on 2023-07-12.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
   
    var percentage: Int {
      (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
