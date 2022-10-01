//
//  MainView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 01/9/22.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("music") private var playMusic = true
    @AppStorage("darkMode") private var darkMode = false
    private let soundPlayer = SoundPlayer()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Formula1-Display-Bold", size: 40)!, .foregroundColor: UIColor.red]
        
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Formula1-Display-Regular", size: 15)!, .foregroundColor: UIColor.red]
        
        if(playMusic){
            soundPlayer.playPause(playPreference: playMusic)
        }
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
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }.accentColor(.red)
        .environmentObject(soundPlayer)
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
