//
//  AudioService.swift
//  retro-calculator
//
//  Created by Bruce Burgess on 7/5/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import UIKit
import AVFoundation

class AudioService {
    static let instance = AudioService()
    
    private var _soundFXPlayer: AVAudioPlayer?
    
    var soundFXPlayer: AVAudioPlayer? {
        get {
            return _soundFXPlayer
        }
        set {
            _soundFXPlayer = newValue
        }
        
    }
    
    var btnUrl: NSURL? {
        if let urlStr = pathForResource("btn", fileType: "wav") {
            return NSURL(string: urlStr)
        }
        
        return nil
    }
    
    
    func pathForResource(fileName: String, fileType: String) -> String? {
        return NSBundle.mainBundle().pathForResource(fileName, ofType: fileType)
    }
    
    func createPlayerWithUrl(audioURL: NSURL) -> AVAudioPlayer? {
        
        do {
            return try AVAudioPlayer(contentsOfURL: audioURL)
        } catch  let err as NSError {
            print(err.debugDescription)
            return nil
        }

    }
    
    func playCurrentSoundFX() -> Bool {
        
        if let player = soundFXPlayer {
            
            if player.playing {
                soundFXPlayer?.stop()
            }
            
            soundFXPlayer?.play()
            
            return player.playing
        }
        
        return false
    }
    
}

    

