//
//  ContentView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 02/9/22.
//

import SwiftUI

struct RankView: View {

    @StateObject var viewModel: RankViewModel = RankViewModel()
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
                    ForEach(viewModel.rankingDrivers, id: \.position) {
                        position in
                            NavigationLink(destination: DriverDetailView(idDriver: position.driver.id)){
                                RankDriverItemView(position: position)
                            }
                    }
                }
                
                Section(header: Text("Teams").font(Font.custom( "Formula1-Display-Regular", size: 12))){
                    ForEach(viewModel.rankingTeams, id: \.position) {
                        position in RankTeamItemView(position: position)
                    }
                }
            }.navigationTitle("Rank")
        }.onAppear{
            if(viewModel.rankingDrivers.isEmpty) {
                viewModel.getRankDrivers()
                viewModel.getRankTeams()
            } 
        }
    }
    
    var regularContent: some View {
        NavigationStack{
            List{
                Section(header: Text("Drivers").font(Font.custom( "Formula1-Display-Regular", size: 16))){
                    ForEach(viewModel.rankingDrivers, id: \.position) {
                        position in
                            NavigationLink(destination: DriverDetailView(idDriver: position.driver.id)){
                                RankDriverItemView(position: position)
                            }
                    }
                }.padding(.init(top: 30, leading: 90, bottom: 0, trailing: 90))
                
                Section(header: Text("Teams").font(Font.custom( "Formula1-Display-Regular", size: 16))){
                    ForEach(viewModel.rankingTeams, id: \.position) {
                        position in RankTeamItemView(position: position)
                    }
                }.padding(.init(top: 30, leading: 90, bottom: 0, trailing: 90))
            }.navigationTitle("Rank")
                
        }.onAppear{
            viewModel.getRankDrivers()
            viewModel.getRankTeams()
        }
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
