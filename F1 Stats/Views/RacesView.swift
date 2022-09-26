//
//  RacesView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import SwiftUI

struct RacesView: View {

    @StateObject var apiService: APIService = APIService()
    
    var body: some View {
            NavigationStack{
                Form {
                    ForEach(apiService.races, id: \.id) {
                        race in Text(race.competition.name ?? "No name").font(Font.custom( "Formula1-Display-Regular", size: 15))
                    }
                }.navigationTitle("Races")
            }.onAppear{
                apiService.getRaces()
            }
        }
}

struct RacesView_Previews: PreviewProvider {
    static var previews: some View {
        RacesView()
    }
}
