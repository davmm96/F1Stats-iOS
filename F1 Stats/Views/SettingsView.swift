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
    @State private var showVersions = false

    
    let options = ToastOptions(
        image: Image(systemName: "info"),
        title: "Current version",
        subtitle: "1.0",
        position: .bottom,
        duration: 10,
        dismissible: true
        )
    
    var body: some View {
        NavigationStack{
                VStack(alignment: .center, spacing: 30){
                    Toggle("Music 🎶", isOn: $playMusic)
                        .font(Font.custom( "Formula1-Display-Regular", size: 20))
                        .onChange(of: playMusic) { (value) in
                            soundPlayer.playPause(playPreference: value)
                        }
                    
                    Toggle("Dark theme", isOn: $darkMode)
                        .font(Font.custom( "Formula1-Display-Regular", size: 20))
                    
                    Button("See versions") {
                                   showVersions = true
                                }
                    
                    ToastView(options: options)
                    
                }.navigationTitle("Settings")
                    .padding(80)
                    .sheet(isPresented: $showVersions) {
                        
                        Text("VERSIONS").padding(30)
                            .font(Font.custom( "Formula1-Display-Bold", size: 30))
                        VersionsViewController()
                            .padding(20)
                            }
                
                Spacer()
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
