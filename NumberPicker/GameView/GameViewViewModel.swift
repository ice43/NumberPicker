//
//  GameViewViewModel.swift
//  NumberPicker
//
//  Created by Serge Broski on 3/14/24.
//

import Foundation
import Observation

@Observable
final class GameViewViewModel {
    var gameOption = GameOptions()
    var alertIsPresented = false
    
    var scores: Int {
        100 - abs(gameOption.targetValue - lround(gameOption.currentValue))
    }
    
    var opacity: Double {
        Double(scores) / 100
    }
    
    func showAlert() {
        alertIsPresented.toggle()
    }
    
    func reset() {
        gameOption.targetValue = Int.random(in: 0...100)
        gameOption.currentValue = Double.random(in: 0...100)
    }
}
