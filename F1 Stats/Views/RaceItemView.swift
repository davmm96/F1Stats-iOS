//
//  RaceItemView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct RaceItemView: View {
    var race: RaceDataModel
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("\(Int(race.laps.total)) laps" )
                    .font(Font.custom( "Formula1-Display-Bold", size: 15))
                    .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 0))
            }.foregroundColor(.red)
            
            VStack(alignment: .leading) {
                Text(race.competition.name ?? "No race data")
                    .font(Font.custom( "Formula1-Display-Bold", size: 15))
                    .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 0))
                
                Text(race.competition.location.city ?? "No city data")
                    .font(Font.custom( "Formula1-Display-Regular", size: 12))
                    .padding(.init(top: 0, leading: 10, bottom: 5, trailing: 0))
                
                Text(race.circuit.name ?? "No circuit data")
                    .font(Font.custom( "Formula1-Display-Regular", size: 12))
                    .padding(.init(top: 0, leading: 10, bottom: 5, trailing: 0))
            }
        }
    }
}

