//
//  ContentView.swift
//  BoardMic
//
//  Created by SunnyFlops on 10/07/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Text("Import Audio Files")
                }
                
                Button {
                    
                } label: {
                    Text("Set CoreAudio Source")
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Reset Source")
                }
                
                .tint(Color.red)
                
                Button {
                    openWindow(id: "about")
                } label: {
                    Text("About")
                }
                
            }
            .padding()
            
            Divider()
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 100)), count: 5)) {
                    Text("1")
                    Text("2")
                    Text("3")
                    Text("4")
                    Text("5")
                    Text("6")
                    Text("7")
                    Text("8")
                    Text("9")
                }
                .padding()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
