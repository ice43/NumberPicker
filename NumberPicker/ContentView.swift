//
//  ContentView.swift
//  NumberPicker
//
//  Created by Serge Broski on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    @State private var score = 0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var isShowingAlert = false

    
    var body: some View {
        VStack(spacing: 20) {
            Text("Move the slider as close to \(targetValue.formatted()) as possible")
            
            HStack {
                Text("0")
                UISliderRepresentation(currentValue: $currentValue, targetValue: targetValue)
                Text("100")
            }
            
            Button(action: checkMeButtonPressed) {
                Text("Check me!")
            }
            .alert("Your score", isPresented: $isShowingAlert, actions: {} ) {
                Text("\(score) points")
            }
            
            Button(action: startOverButtonPressed) {
                Text("Start over")
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func checkMeButtonPressed() {
        score = computeScore()
        isShowingAlert = true
    }
    
    private func startOverButtonPressed() {
        currentValue = 50.0
        score = 0
        targetValue = Int.random(in: 0...100)
    }
}

#Preview {
    ContentView()
}
