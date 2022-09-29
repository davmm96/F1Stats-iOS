//
//  CircuitItemView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct CircuitItemView: View {

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var circuit: CircuitDataModel
    
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
        Section {
            VStack(alignment: .leading, spacing: 30){
                VStack(alignment: .leading){
                    Text(circuit.name ?? "No circuit data")
                        .font(Font.custom( "Formula1-Display-Bold", size: 18))
                    Text(circuit.competition.location.country ?? "No country data")
                        .font(Font.custom( "Formula1-Display-Regular", size: 15))
                        .foregroundColor(Color("GrayLabel"))
                }.padding(.top, 8)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Circuit length")
                            .font(Font.custom( "Formula1-Display-Regular", size: 12))
                            .padding(.bottom, 3)
                            .foregroundColor(Color("GrayLabel"))
                        Text(circuit.length ?? "No length data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 15))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Laps")
                            .font(Font.custom( "Formula1-Display-Regular", size: 12))
                            .padding(.bottom, 3)
                            .foregroundColor(Color("GrayLabel"))
                        Text(circuit.laps.flatMap(String.init) ?? "No laps data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 15))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("First Grand Prix")
                            .font(Font.custom( "Formula1-Display-Regular", size: 12))
                            .padding(.bottom, 3)
                            .foregroundColor(Color("GrayLabel"))
                        Text(circuit.first_grand_prix.flatMap(String.init) ?? "No first data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 15))
                    }
                }
                VStack(alignment: .leading){
                    Text("Lap record")
                        .font(Font.custom( "Formula1-Display-Regular", size: 12))
                        .padding(.bottom, 3)
                        .foregroundColor(Color("GrayLabel"))
                    Text(circuit.lap_record?.time ?? "No time data")
                        .font(Font.custom( "Formula1-Display-Bold", size: 15))
                        .padding(.bottom, 3)
                        .foregroundColor(.red)
                    Text(circuit.lap_record?.driver ?? "No driver data")
                        .font(Font.custom( "Formula1-Display-Regular", size: 10))
                        .padding(.bottom, 3)
                        .foregroundColor(Color("GrayLabel"))
                }
            }
        }
    }
    
    var regularContent: some View {
        Section {
            VStack(alignment: .leading, spacing: 30){
                VStack(alignment: .leading){
                    Text(circuit.name ?? "No circuit data")
                        .font(Font.custom( "Formula1-Display-Bold", size: 23))
                    Text(circuit.competition.location.country ?? "No country data")
                        .font(Font.custom( "Formula1-Display-Regular", size: 18))
                        .foregroundColor(Color("GrayLabel"))
                }.padding(.top, 8)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Circuit length")
                            .font(Font.custom( "Formula1-Display-Regular", size: 15))
                            .padding(.bottom, 3)
                            .foregroundColor(Color("GrayLabel"))
                        Text(circuit.length ?? "No length data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 18))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Laps")
                            .font(Font.custom( "Formula1-Display-Regular", size: 15))
                            .padding(.bottom, 3)
                            .foregroundColor(Color("GrayLabel"))
                        Text(circuit.laps.flatMap(String.init) ?? "No laps data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 18))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("First Grand Prix")
                            .font(Font.custom( "Formula1-Display-Regular", size: 15))
                            .padding(.bottom, 3)
                            .foregroundColor(Color("GrayLabel"))
                        Text(circuit.first_grand_prix.flatMap(String.init) ?? "No first data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 18))
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Lap record")
                            .font(Font.custom( "Formula1-Display-Regular", size: 15))
                            .padding(.bottom, 3)
                            .foregroundColor(Color("GrayLabel"))
                        Text(circuit.lap_record?.time ?? "No time data")
                            .font(Font.custom( "Formula1-Display-Bold", size: 18))
                            .padding(.bottom, 3)
                            .foregroundColor(.red)
                        Text(circuit.lap_record?.driver ?? "No driver data")
                            .font(Font.custom( "Formula1-Display-Regular", size: 12))
                            .padding(.bottom, 3)
                    }
                }
            }
        }
    }
}


struct CircuitItemView_Previews: PreviewProvider {
    static var previews: some View {
        CircuitItemView(circuit: CircuitDataModel.example)
    }
}
