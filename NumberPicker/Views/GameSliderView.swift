//
//  GameSliderView.swift
//  NumberPicker
//
//  Created by Serge Broski on 3/14/24.
//

import SwiftUI

struct GameSliderView: View {
    @Bindable var gameViewVM: GameViewViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            let targetValue = gameViewVM.gameOption.targetValue
            Text("Move the slider as close to \(targetValue) as possible")
            
            HStack {
                Text("0")
                UISliderRepresentation(
                    currentValue: $gameViewVM.gameOption.currentValue,
                    opacity: gameViewVM.opacity
                )
                Text("100")
            }
        }
    }
}

#Preview {
    GameSliderView(gameViewVM: GameViewViewModel())
}
