//
//  AudioManager.swift
//  BoardMic
//
//  Created by SunnyFlops on 10/07/2025.
//

import Foundation
import Combine
import UniformTypeIdentifiers
import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    private var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var volume: Float = 1.0 { // or is this 100???
        didSet {
            audioPlayer?.volume = volume
        }
    }

    private var currentURL: URL?

    func playAudio(from url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            currentURL = url
            audioPlayer?.volume = volume
            audioPlayer?.play()
            isPlaying = true
        } catch {
            print("Failed to play audio: \(error)")
            isPlaying = false
        }
    }

    func playOrPause() {
        guard let player = audioPlayer else { return }

        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
}


