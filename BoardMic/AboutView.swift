//
//  AboutView.swift
//  BoardMic
//
//  Created by SunnyFlops on 10/07/2025.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "person.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Created by SunnyFlops")
            
            Button("Discord Server") {
                @Environment(\.openURL) var openURL
                
                if let url = URL(string: "https://discord.gg/SGGnUUjf7P") {
                    openURL(url)
                }
            }
            
            Link("GitHub Repo", destination: URL(string: "https://github.com/SunnyFloppyDiskStudios/BoardMic")!)
            
            Link("sunnyflops.net", destination: URL(string: "https://sunnyflops.net")!)
            
            Spacer()
            
            Text("The app does not create any copies of audio files used in the soundboard function. As a result, audio files will not show up in the app if you delete them from the source. We recommend sorting audio files you intend to use beforehand!")
                .foregroundStyle(Color.yellow)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("v0.0.0 (pa)")
            
        }
        .padding()
    }
}

#Preview {
    AboutView()
}
