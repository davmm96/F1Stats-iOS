//
//  SettingsView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 29/9/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var soundPlayer: SoundPlayer
    @AppStorage("music") private var playMusic = true
    @AppStorage("darkMode") private var darkMode = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Toggle("Music 🎶", isOn: $playMusic)
                    .onChange(of: playMusic) { (value) in
                        soundPlayer.playPause(playPreference: value)
                    }
                
                Toggle("Dark theme", isOn: $darkMode)
                
            }.navigationTitle("Settings")
                .padding()
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
