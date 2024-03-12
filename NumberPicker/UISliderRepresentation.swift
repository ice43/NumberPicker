//
//  UISliderRepresentation.swift
//  NumberPicker
//
//  Created by Serge Broski on 3/12/24.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var currentValue: Double
    
    let targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        updateThumbColor(slider)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        updateThumbColor(uiView)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func updateThumbColor(_ slider: UISlider) {
        let score = computeScore()
        let alpha = Double(score) / 100
        slider.thumbTintColor = UIColor(white: 1.0, alpha: CGFloat(alpha))
    }
    
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
    }
}

#Preview {
    UISliderRepresentation(currentValue: .constant(50), targetValue: 25)
}
