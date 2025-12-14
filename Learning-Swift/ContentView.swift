//
//  ContentView.swift
//  Learning-Swift
//
//  Created by Marc Miller on 4/19/25.
//

import SwiftUI

struct ContentView: View {
    var game: Game = Game()
    var body: some View {
        VStack {
            //This will be our doodle
            Image(systemName: "trash")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .position(
                    x: game.doodle.position.x,
                    y: game.doodle.position.y
                )
            for platform in game.spritesInMap {
                Image(systemName: "folder")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .position(
                        x: sprite.position.x,
                        y: sprite.position.y
                    )
            }
        }
        
    }
    
    
}

#Preview {
    ContentView()
}
