//
//  UISliderRepresentation.swift
//  NumberPicker
//
//  Created by Serge Broski on 3/12/24.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var currentValue: Double
    
    let opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.thumbTintColor = .systemRed.withAlphaComponent(opacity)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = .systemRed.withAlphaComponent(opacity)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

#Preview {
    UISliderRepresentation(currentValue: .constant(50), opacity: 1.0)
}
