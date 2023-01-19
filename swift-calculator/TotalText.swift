//
//  TotalText.swift
//  swift-calculator
//
//  Created by Malgorzata Lasota on 18/01/2023.
//

import SwiftUI

struct TotalText: View {
    var value = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 60))
            .fontWeight(.light)
            .foregroundColor(Color.white)
            .padding()
            .lineLimit(1)
    }
}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText()
            .background(.black)
    }
}
