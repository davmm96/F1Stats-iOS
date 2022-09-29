//
//  RaceItemView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct RaceItemView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    var race: RaceDataModel
    
    var horizontallyConstrained: Bool {
        return horizontalSizeClass == .compact
    }
    
    var body: some View {
        Group {
            if horizontallyConstrained {
                compactContent
            } else {
                regularContent
            }
        }
    }
    
    var compactContent: some View {
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
    
    var regularContent: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("\(Int(race.laps.total)) laps" )
                    .font(Font.custom( "Formula1-Display-Bold", size: 20))
                    .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 0))
            }.foregroundColor(.red)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading){
                    Text(race.competition.name ?? "No race data")
                        .font(Font.custom( "Formula1-Display-Bold", size: 18))
                    
                    Text(race.competition.location.city ?? "No city data")
                        .font(Font.custom( "Formula1-Display-Regular", size: 15))
                        .padding(.top, 10)
                }
                
                Spacer()
                
                Text(race.circuit.name ?? "No circuit data")
                    .font(Font.custom( "Formula1-Display-Regular", size: 15))
            }.padding(20)
        }
    }
}

struct RaceItemView_Previews: PreviewProvider {
    static var previews: some View {
        RaceItemView(race: RaceDataModel.example)
            .previewLayout(.sizeThatFits)
    }
}

