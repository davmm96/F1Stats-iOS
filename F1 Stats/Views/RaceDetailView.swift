//
//  RaceDetailView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import SwiftUI

struct RaceDetailView: View {
    var race: RaceDataModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text(race.competition.name ?? "No name")
                .foregroundColor(.white)
                .font(.system(size:20))
        }.background{LinearGradient(colors: [.red, .white], startPoint: .topLeading, endPoint: .bottomTrailing)}
    }
}
