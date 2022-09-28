//
//  InfoCircuitView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 28/9/22.
//

import SwiftUI

struct InfoCircuitView: View {
    var info: RaceDataModel
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: info.circuit.image ?? "")){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(maxWidth: 200, maxHeight: 200)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                }
            }
            
            HStack{
                Text("Distance:")
                    .font(Font.custom( "Formula1-Display-Bold", size: 18))
                Text("\(info.distance ?? "No name")")
                    .font(Font.custom( "Formula1-Display-Regular", size: 18))
            }.padding(.top, 30)
            
            HStack{
                Text("Laps:")
                    .font(Font.custom( "Formula1-Display-Bold", size: 18))
                Text("\(Int(info.laps.total))")
                    .font(Font.custom( "Formula1-Display-Regular", size: 18))
            }.padding(.top, 30)
        }
    }
}

struct InfoCircuitView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCircuitView(info: RaceDataModel.example)
    }
}
