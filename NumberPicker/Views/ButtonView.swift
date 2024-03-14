//
//  ButtonView.swift
//  NumberPicker
//
//  Created by Serge Broski on 3/12/24.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .foregroundStyle(.white)
        .frame(width: 120, height: 45)
        .background(.tint)
        .clipShape(Capsule())
    }
}

#Preview {
    ButtonView(title: "Check me!", action: {} )
}
