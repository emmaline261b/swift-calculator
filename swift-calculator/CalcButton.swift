//
//  CalcButton.swift
//  swift-calculator
//
//  Created by Malgorzata Lasota on 19/01/2023.
//

import SwiftUI

struct CalcButton: View {
    var buttonText : String = "1"
    var buttonColor : Color = Color(hue: 1.0, saturation: 0.03, brightness: 0.222)
    var buttonWidth : CGFloat = 70
    var mode : CalculatorMode = .notSet
    
    var action : (CalcButton) -> Void = {_ in }
    
    var body: some View {
        Button {
            action(self)
        } label: {
            Text(buttonText)
                .fontWeight(.light)
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(width: buttonWidth, height: 70, alignment: .center)
                .background(buttonColor)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }
    }
    
}

struct CalcButton_Previews: PreviewProvider {
    static var previews: some View {
        CalcButton()
    }
}
