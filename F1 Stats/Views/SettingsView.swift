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
        title: "F1 STATS",
        subtitle: "1.0",
        position: .bottom,
        duration: 5,
        dismissible: true
        )
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(alignment: .center, spacing: 30){
                    
                    Toggle("Music 🎶", isOn: $playMusic)
                        .font(Font.custom( "Formula1-Display-Regular", size: 20))
                        .onChange(of: playMusic) { (value) in
                            soundPlayer.playPause(playPreference: value)
                        }
                    
                    Toggle("Dark theme", isOn: $darkMode)
                        .font(Font.custom( "Formula1-Display-Regular", size: 20))
                    
                    Button(action: {showVersions = true}, label:
                            {
                                Text("Versions")
                                    .font(Font.custom( "Formula1-Display-Regular", size: 15))
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.red)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                })
                    Spacer()
                }
                
                ToastView(options: options)
            }.navigationTitle("Settings")
                .padding(80)
                .sheet(isPresented: $showVersions){
                    Text("VERSIONS").padding(30)
                        .font(Font.custom( "Formula1-Display-Bold", size: 30))
                    VersionsViewController()
                        .padding(20)
                }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
