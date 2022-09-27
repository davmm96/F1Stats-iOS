//
//  RacesView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import SwiftUI

struct RacesView: View {

    @StateObject var apiService: APIService = APIService()
    
    let releaseDate = Date()
    
    static let stackDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MMM/yyyy HH:mm"
        return formatter
    }()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(apiService.races, id: \.id) {
                    race in RaceItemView(race: race)
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

