//
//  SoundManager.swift
//  F1 Stats
//
//  Created by David Melero Morant on 29/9/22.
//

import Foundation
import AVFoundation

class SoundPlayer: ObservableObject {
    
    var player: AVAudioPlayer?
    
    func playFirst() {
        let path = Bundle.main.path(forResource: "f1theme", ofType: "mp3")?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        player = try! AVAudioPlayer(contentsOf: URL(string: path!)!)
        player?.prepareToPlay()
        player?.play()
        player?.volume = 0.05
    }
    
    func playPause(playPreference: Bool){
        
        if(player != nil)
        {
            if(player!.isPlaying)
            {
                player?.stop()
            }
            else {
                player?.play()
            }
        }
        else if(player == nil && playPreference)
        {
            playFirst()
        }
        else {
            return
        }
        
    }
}
