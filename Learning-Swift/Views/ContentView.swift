//
//  ContentView.swift
//  Learning-Swift
//
//  Created by Marc Miller on 4/19/25.
//

import SwiftUI

struct ContentView: View {
    @State var nav: Navigation = Navigation()
    
    var body: some View {
        ZStack {
            if nav.isStart {
                StartScreen(nav: $nav)
            } else if nav.isPlay {
                // Play View
            } else if nav.isSettings {
                // Settings View
            } else if nav.isCosmetic {
                // Cosmetic View
            }
        }
    }
}

struct Navigation {
    var current: Page = .Start
    var isStart: Bool {
        return self.current == .Start
    }
    var isPlay: Bool {
        return self.current == .Play
    }
    var isCosmetic: Bool {
        return self.current == .Cosmetic
    }
    var isSettings: Bool {
        return self.current == .Settings
    }
    mutating func changePage(_ nextPage: Page) {
        self.current = nextPage
    }
}

enum Page {
    case Start
    case Play
    case Cosmetic
    case Settings
}

#Preview {
    ContentView()
}
