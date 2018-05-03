//
//  SoundManager.swift
//  bullEye
//
//  Created by antonio martin moreno on 25/04/2018.
//  Copyright © 2018 antonio martin moreno. All rights reserved.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

struct SoundFile {
    let name:String
    let ext:String
}

func playSoundOnLoadGame(){
    let soundFile = SoundFile(name:"37072_technical_logo_freebpm_proud_music_preview",ext:"mp3")
    playSound(file:soundFile)
}

func playSoundOnInit(){
    let soundFile = SoundFile(name:"37072_technical_logo_freebpm_proud_music_preview",ext:"mp3")
    playSound(file:soundFile)
}

func playSoundOnWin(){
    let soundFile = SoundFile(name:"26588_vaudeville-vamp-ender-css029102_proud_music_preview",ext:"mp3")
    playSound(file:soundFile)
}

func playSoundOnLose(){
    let introSoundFile = SoundFile(name:"30736_mellow-descending-organ-accent_scf015601_proud_music_preview",ext:"mp3")
    playSound(file:introSoundFile)
}

func playSoundOnStartOver(){
    let introSoundFile = SoundFile(name:"30727_charge-fanfare-high-organ-version_scf016201_proud_music_preview",ext:"mp3")
    playSound(file:introSoundFile)
}

func playSoundOnHitMe(){
    let introSoundFile = SoundFile(name:"Comical drip sound",ext:"wav")
    playSound(file:introSoundFile)
}

func playSoundOnHelp(){
    let introSoundFile = SoundFile(name:"looperman-l-1887338-0117207-djandre808-funk-brazil-7",ext:"wav")
    playSound(file:introSoundFile)
}

func playSound(file: SoundFile) {
    guard let url = Bundle.main.url(forResource: file.name, withExtension: file.ext) else { return }
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        /* iOS 10 and earlier require the following line:
         player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        guard let player = player else { return }
        player.play()
    } catch let error {
        print(error.localizedDescription)
    }
}

