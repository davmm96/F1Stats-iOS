//
//  RacesView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import SwiftUI

struct RacesView: View {

    @StateObject var apiService: APIService = APIService()
    @State private var selectedRace: TypeRaces = .upcoming
    
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont(name: "Formula1-Display-Bold", size: 12)!,.foregroundColor : UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont(name: "Formula1-Display-Regular", size: 12)!,.foregroundColor : UIColor.black], for: .normal)
    }
    
    var body: some View {
        NavigationStack{
                Picker("Choose", selection: $selectedRace) {
                    ForEach(TypeRaces.allCases, id: \.self) {
                        Text($0.rawValue).font(Font.custom( "Formula1-Display-Bold", size: 15))
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                RaceChoose(selectedRace: selectedRace).navigationTitle("Races")
        }
    }
}

enum TypeRaces: String, CaseIterable{
    case upcoming = "Upcoming"
    case past = "Past"
}

struct RaceChoose: View {
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
                
            }.onAppear{apiService.getRaces()}
            .listStyle(.plain)
            
        case .past:
            List{
                ForEach(apiService.pastRaces, id: \.id) {
                    race in
                    NavigationLink(destination: RaceDetailView(race: race)){
                        RaceItemView(race: race)
                    }
                }
                
            }.onAppear{apiService.getPastRaces()}
            .listStyle(.plain)
        }
    }
}

struct RacesView_Previews: PreviewProvider {
    static var previews: some View {
        RacesView()
    }
}

