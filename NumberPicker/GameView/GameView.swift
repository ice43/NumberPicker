//
//  GameView.swift
//  NumberPicker
//
//  Created by Serge Broski on 3/12/24.
//

import SwiftUI

struct GameView: View {
    @State private var gameViewVM = GameViewViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            GameSliderView(gameViewVM: gameViewVM)
            
            ButtonView(
                title: "Check me!",
                action: gameViewVM.showAlert
            )
            .alert("Your score",
                   isPresented: $gameViewVM.alertIsPresented,
                   actions: {}
            ) {
                Text("\(gameViewVM.scores) points")
            }
            
            ButtonView(
                title: "Start over",
                action: gameViewVM.reset
            )
        }
        .padding()
    }
}

#Preview {
    GameView()
}
