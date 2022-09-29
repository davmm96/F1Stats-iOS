//
//  ContentView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import SwiftUI

struct RankView: View {

    @StateObject var apiService: APIService = APIService()
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

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
    
    var regularContent: some View {
        NavigationStack{
            List{
                Section(header: Text("Drivers").font(Font.custom( "Formula1-Display-Regular", size: 16))){
                    ForEach(apiService.rankingDrivers, id: \.position) {
                        position in
                            NavigationLink(destination: DriverDetailView(idDriver: position.driver.id)){
                                RankDriverItemView(position: position)
                            }
                    }
                }.padding(.init(top: 30, leading: 90, bottom: 0, trailing: 90))
                
                Section(header: Text("Teams").font(Font.custom( "Formula1-Display-Regular", size: 16))){
                    ForEach(apiService.rankingTeams, id: \.position) {
                        position in RankTeamItemView(position: position)
                    }
                }.padding(.init(top: 30, leading: 90, bottom: 0, trailing: 90))
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
