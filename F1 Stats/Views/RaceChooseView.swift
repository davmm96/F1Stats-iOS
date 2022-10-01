//
//  RaceChooseView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 28/9/22.
//

import SwiftUI

struct RaceChooseView: View {
    @StateObject var viewModel: RacesViewModel = RacesViewModel()
    var selectedRace: TypeRaces
    
    var body: some View {
        switch selectedRace{
            case .upcoming:
                List{
                    ForEach(viewModel.races, id: \.id) {
                        race in
                        NavigationLink(destination: RaceDetailView(race: race)){
                            RaceItemView(race: race)
                        }
                    }
                }.onAppear{
                    if(viewModel.races.isEmpty){
                        viewModel.getRaces()
                    }
                    
                }
                .listStyle(.plain)
                
            case .past:
                List{
                    ForEach(viewModel.pastRaces, id: \.id) {
                        race in
                        NavigationLink(destination: RaceDetailView(race: race)){
                            RaceItemView(race: race)
                        }
                    }
                }.onAppear{
                    if(viewModel.pastRaces.isEmpty){
                        viewModel.getPastRaces()
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
