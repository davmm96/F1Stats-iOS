//
//  TitleOverlay.swift
//  F1 Stats
//
//  Created by David Melero Morant on 28/9/22.
//

import SwiftUI

struct TitleOverlay: View {
    
    var title: String
    var body: some View {
        ZStack {
            Text(title)
                .font(Font.custom( "Formula1-Display-Bold", size: 20))
                .padding(8)
                .foregroundColor(.red)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(8)
    }
}
struct TitleOverlay_Previews: PreviewProvider {
    static var previews: some View {
        TitleOverlay(title: "Spain 2022")
    }
}
