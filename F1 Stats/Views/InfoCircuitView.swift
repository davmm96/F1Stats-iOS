//
//  InfoCircuitView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 28/9/22.
//

import SwiftUI

struct InfoCircuitView: View {
    var distance: String
    var laps: Int
    var image: Image
    
    var body: some View {
        VStack{
            image.resizable()
                .scaledToFill()
                .clipped()
                .frame(maxWidth: 200, maxHeight: 200)
            
            HStack{
                Text("Distance:")
                    .font(Font.custom( "Formula1-Display-Bold", size: 18))
                Text("\(distance )")
                    .font(Font.custom( "Formula1-Display-Regular", size: 18))
            }.padding(.top, 30)
            
            HStack{
                Text("Laps:")
                    .font(Font.custom( "Formula1-Display-Bold", size: 18))
                Text("\(Int(laps))")
                    .font(Font.custom( "Formula1-Display-Regular", size: 18))
            }.padding(.top, 30)
        }
    }
}

struct InfoCircuitView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCircuitView(distance: "307 Kms", laps: 53, image: Image(systemName: "photo"))
    }
}
