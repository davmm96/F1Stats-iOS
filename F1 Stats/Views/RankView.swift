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
                Form {
                    ForEach(apiService.ranking, id: \.position) {
                        position in Text(position.driver.name ?? "No name").font(Font.custom( "Formula1-Display-Regular", size: 15))
                    }
                }.navigationTitle("Rank")
            }.onAppear{
                apiService.getRank()
            }
        }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
