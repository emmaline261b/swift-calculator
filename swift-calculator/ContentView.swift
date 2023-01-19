//
//  ContentView.swift
//  swift-calculator
//
//  Created by Malgorzata Lasota on 18/01/2023.
//

import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case subtraction
    case multiplication
}

struct ContentView: View {
    
    @State var currentValue = "0"
    @State var currentMode : CalculatorMode = .notSet
    @State var lastButtonWasMode : Bool = false
    
    var body: some View {
        
        ZStack {
            Color(.black)
            VStack {
                TotalText(value: currentValue)
                HStack {
                    CalcButton(buttonText: "1", action: didPressNumber)
                    CalcButton(buttonText: "2", action: didPressNumber)
                    CalcButton(buttonText: "3", action: didPressNumber)
                    CalcButton(buttonText: "+", buttonColor: .orange, mode: .addition, action: didPressMode)
                }
                HStack {
                    CalcButton(buttonText: "4", action: didPressNumber)
                    CalcButton(buttonText: "5", action: didPressNumber)
                    CalcButton(buttonText: "6", action: didPressNumber)
                    CalcButton(buttonText: "-", buttonColor: .orange, mode: .subtraction, action: didPressMode)
                }
                HStack {
                    CalcButton(buttonText: "7", action: didPressNumber)
                    CalcButton(buttonText: "8", action: didPressNumber)
                    CalcButton(buttonText: "9", action: didPressNumber)
                    CalcButton(buttonText: "x", buttonColor: .orange, mode: .multiplication, action: didPressMode)
                }
                HStack {
                    CalcButton(buttonText: "0", buttonWidth: 148, action: didPressNumber)
                    CalcButton(buttonText: "C", buttonColor: Color(hue: 1.0, saturation: 0.0, brightness: 0.716), action: didPressClear(button:))
                    CalcButton(buttonText: "=", buttonColor: .orange, action: didPressEnter(button:))
                }
                
            }
        }
        .ignoresSafeArea()
    }
    
    func didPressNumber(button : CalcButton) {
        if let parsedValue = Int(currentValue + button.buttonText) {
            currentValue = "\(parsedValue)"
        } else {
            currentValue = "error"
        }
        
        if lastButtonWasMode {
            lastButtonWasMode = false
        }
        
    }
    
    func didPressMode(button : CalcButton) {
        currentMode = button.mode
        lastButtonWasMode = true
    }
    
    func didPressEnter(button : CalcButton) {
        if (currentMode == .notSet || lastButtonWasMode) {
            return
        }
    }
    
    func didPressClear(button : CalcButton) {
        currentValue = "0"
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}