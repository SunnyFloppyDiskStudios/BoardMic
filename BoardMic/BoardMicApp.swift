//
//  BoardMicApp.swift
//  BoardMic
//
//  Created by SunnyFlops on 10/07/2025.
//

import SwiftUI

@main
struct BoardMicApp: App {
    var body: some Scene {
        WindowGroup("BoardMic", id: "content") {
            ContentView()
        }.defaultSize(width: 650, height: 500)
        
        Window("About", id: "about") {
            AboutView()
        }.defaultSize(width: 375, height: 500)
        
        Settings {
            AboutView()
        }.defaultSize(width: 375, height: 500)
    }
}
