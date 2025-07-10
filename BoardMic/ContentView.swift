//
//  ContentView.swift
//  BoardMic
//
//  Created by SunnyFlops on 10/07/2025.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @Environment(\.openWindow) var openWindow
    
    @State private var importedFiles: [URL] = []
    @State private var showingFileImporter = false
    @State private var selectedFile: URL?
    @StateObject private var audioPlayerVM = AudioPlayerViewModel()

    var body: some View {
        VStack {
            HStack {
                Button("Import Audio Files") {
                    showingFileImporter = true
                }
                .fileImporter(
                    isPresented: $showingFileImporter,
                    allowedContentTypes: [.audio],
                    allowsMultipleSelection: true
                ) { result in
                    if case let .success(urls) = result {
                        importedFiles.append(contentsOf: urls)
                    }
                }

                Button("Set CoreAudio Source") {
                    // Placeholder
                }

                Spacer()

                Button("Reset Source") {
                    // Placeholder
                }
                .tint(.red)

                Button("About") {
                    openWindow(id: "about")
                }
            }
            .padding()

            HStack {
                Button(audioPlayerVM.isPlaying ? "Pause" : "Play") {
                    if let selected = selectedFile {
                        if audioPlayerVM.isPlaying {
                            audioPlayerVM.playOrPause()
                        } else {
                            audioPlayerVM.playAudio(from: selected)
                        }
                    }
                }
                .tint(.yellow)
                .disabled(selectedFile == nil)
                
                Slider(value: $audioPlayerVM.volume, in: 0...1) {}
                minimumValueLabel: {
                    Image(systemName: "speaker.fill")
                } maximumValueLabel: {
                    Image(systemName: "speaker.wave.3.fill")
                }
                .frame(width: 150)

                Spacer()
            }
            .padding()

            Divider()

            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 100)), count: 5)) {
                    ForEach(importedFiles, id: \.self) { fileURL in
                        Button(fileURL.deletingPathExtension().lastPathComponent) {
                            selectedFile = fileURL
                            audioPlayerVM.playAudio(from: fileURL)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding()
            }

            Spacer()
        }
        .padding()
    }
}
