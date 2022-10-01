//
//  RaceChooseView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 28/9/22.
//

import SwiftUI

struct RaceChooseView: View {
    @StateObject var apiService: APIService = APIService()
    var selectedRace: TypeRaces
    
    var body: some View {
        switch selectedRace{
            case .upcoming:
                List{
                    ForEach(apiService.races, id: \.id) {
                        race in
                        NavigationLink(destination: RaceDetailView(race: race)){
                            RaceItemView(race: race)
                        }
                    }
                }.onAppear{
                    if(apiService.races.isEmpty){
                        apiService.getRaces()
                    }
                    
                }
                .listStyle(.plain)
                
            case .past:
                List{
                    ForEach(apiService.pastRaces, id: \.id) {
                        race in
                        NavigationLink(destination: RaceDetailView(race: race)){
                            RaceItemView(race: race)
                        }
                    }
                }.onAppear{
                    if(apiService.pastRaces.isEmpty){
                        apiService.getPastRaces()
                    }
                }
                .listStyle(.plain)
        }
    }
}

struct RaceChooseView_Previews: PreviewProvider {
    static var previews: some View {
        RaceChooseView(selectedRace: .upcoming)
    }
}
