//
//  ContentView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import SwiftUI

struct CircuitsView: View {

    @StateObject var apiService: APIService = APIService()
    
    var body: some View {
        NavigationStack{
                Form {
                    ForEach(apiService.circuits, id: \.id) {
                        circuit in Text(circuit.name ?? "No name").font(Font.custom( "Formula1-Display-Regular", size: 15))
                    }
                }.navigationTitle("Circuits")
            }.onAppear{
                apiService.getCircuits()
            }
        }
}

struct CircuitsView_Previews: PreviewProvider {
    static var previews: some View {
        CircuitsView()
    }
}

