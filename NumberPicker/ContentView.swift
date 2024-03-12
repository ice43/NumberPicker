//
//  ContentView.swift
//  NumberPicker
//
//  Created by Serge Broski on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    
    private let targetValue = Int.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Move the slider as close to \(targetValue.formatted()) as possible")
            
            HStack {
                Text("0")
                UISliderRepresentation(currentValue: $currentValue, targetValue: targetValue)
                Text("100")
            }
            
            Button(action: {} ) {
                Text("Check me!")
            }
            
            Button(action: {} ) {
                Text("Start over")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
