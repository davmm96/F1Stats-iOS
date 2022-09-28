//
//  RacesView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import SwiftUI

enum TypeRaces: String, CaseIterable{
    case upcoming = "Upcoming"
    case past = "Past"
}

struct RacesView: View {
    @State private var selectedRace: TypeRaces = .upcoming
    
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont(name: "Formula1-Display-Bold", size: 12)!,.foregroundColor : UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont(name: "Formula1-Display-Regular", size: 12)!,.foregroundColor : UIColor.black], for: .normal)
    }
    
    var body: some View {
        NavigationStack{
            Picker("", selection: $selectedRace) {
                ForEach(TypeRaces.allCases, id: \.self) {
                    Text($0.rawValue).font(Font.custom( "Formula1-Display-Bold", size: 15))
                }
            }
            .pickerStyle(.segmented)
            .padding()
            RaceChooseView(selectedRace: selectedRace).navigationTitle("Races")
        }
    }
}

struct RacesView_Previews: PreviewProvider {
    static var previews: some View {
        RacesView()
    }
}

