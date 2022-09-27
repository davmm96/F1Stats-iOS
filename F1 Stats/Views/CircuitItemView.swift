//
//  CircuitItemView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct CircuitItemView: View {
    
    var circuit: CircuitDataModel
    
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 30){
                VStack(alignment: .leading){
                    Text(circuit.name ?? "No circuit data")
                        .font(Font.custom( "Formula1-Display-Bold", size: 18))
                    Text(circuit.competition.location.country ?? "No country data")
                        .font(Font.custom( "Formula1-Display-Regular", size: 15))
                        .foregroundColor(Color(white: 0.4))
                }.padding(.init(top: 8, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    VStack(alignment: .leading){
                        Text("Circuit length")
                            .font(Font.custom( "Formula1-Display-Regular", size: 12))
                            .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 0))
                            .foregroundColor(Color(white: 0.4))
                        Text(circuit.length ?? "No length data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 15))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Laps")
                            .font(Font.custom( "Formula1-Display-Regular", size: 12))
                            .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 0))
                            .foregroundColor(Color(white: 0.4))
                        Text(circuit.laps.flatMap(String.init) ?? "No laps data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 15))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("First Grand Prix")
                            .font(Font.custom( "Formula1-Display-Regular", size: 12))
                            .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 0))
                            .foregroundColor(Color(white: 0.4))
                        Text(circuit.first_grand_prix.flatMap(String.init) ?? "No first data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 15))
                    }
                }
                VStack(alignment: .leading){
                    Text("Lap record")
                        .font(Font.custom( "Formula1-Display-Regular", size: 12))
                        .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 0))
                        .foregroundColor(Color(white: 0.4))
                    Text(circuit.lap_record?.time ?? "No time data")
                        .font(Font.custom( "Formula1-Display-Bold", size: 15))
                        .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 0))
                        .foregroundColor(.red)
                    Text(circuit.lap_record?.driver ?? "No driver data")
                        .font(Font.custom( "Formula1-Display-Regular", size: 10))
                        .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 0))
                        .foregroundColor(Color(white: 0.4))
                }
            }
        }
    }
}