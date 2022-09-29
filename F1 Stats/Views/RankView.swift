//
//  ContentView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import SwiftUI

struct RankView: View {

    @StateObject var apiService: APIService = APIService()

    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Drivers").font(Font.custom( "Formula1-Display-Regular", size: 12))){
                    ForEach(apiService.rankingDrivers, id: \.position) {
                        position in
                            NavigationLink(destination: DriverDetailView(idDriver: position.driver.id)){
                                RankDriverItemView(position: position)
                            }
                    }
                }
                
                Section(header: Text("Teams").font(Font.custom( "Formula1-Display-Regular", size: 12))){
                    ForEach(apiService.rankingTeams, id: \.position) {
                        position in RankTeamItemView(position: position)
                    }
                }
            }.navigationTitle("Rank")
        }.onAppear{
            apiService.getRank()
            apiService.getRankTeams()
        }
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
