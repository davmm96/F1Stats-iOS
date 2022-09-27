//
//  MainView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Formula1-Display-Bold", size: 40)!, .foregroundColor: UIColor.red]
        
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Formula1-Display-Regular", size: 15)!, .foregroundColor: UIColor.red]
    }
    
    var body: some View {
        TabView{
            RacesView()
                .tabItem {
                    Label("Races", systemImage: "flag.checkered")
                }
            RankView()
                    .tabItem {
                        Label("Rank", systemImage: "trophy")
                    }
            CircuitsView()
                .tabItem {
                    Label("Circuits", systemImage: "globe.europe.africa")
                }
        }.accentColor(.red)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(APIService())
    }
}
