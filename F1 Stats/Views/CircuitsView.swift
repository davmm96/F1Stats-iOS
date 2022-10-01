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
                List {
                    ForEach(apiService.circuits, id: \.id) {
                        circuit in CircuitItemView(circuit: circuit)
                    }
                }.navigationTitle("Circuits")
                .listStyle(InsetGroupedListStyle())
            }.onAppear{
                if(apiService.circuits.isEmpty){
                    apiService.getCircuits()
                }
            }
        }
}

struct CircuitsView_Previews: PreviewProvider {
    static var previews: some View {
        CircuitsView()
    }
}

