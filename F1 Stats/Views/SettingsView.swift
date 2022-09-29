//
//  SettingsView.swift
//  F1 Stats
//
//  Created by David Melero Morant on 29/9/22.
//

import SwiftUI
import SwiftUIToast

struct SettingsView: View {
    @EnvironmentObject var soundPlayer: SoundPlayer
    @AppStorage("music") private var playMusic = true
    @AppStorage("darkMode") private var darkMode = false
    
    let options = ToastOptions(
        image: Image(systemName: "info"),
        title: "Version",
        subtitle: "1.0",
        position: .bottom,
        duration: 10,
        dismissible: true
        )
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing: 30){
                Toggle("Music 🎶", isOn: $playMusic)
                    .onChange(of: playMusic) { (value) in
                        soundPlayer.playPause(playPreference: value)
                    }
                
                Toggle("Dark theme", isOn: $darkMode)
                
                ToastView(options: options)
                    .padding()
                
            }.navigationTitle("Settings")
                .padding(80)
            Spacer()
        }
    }

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
