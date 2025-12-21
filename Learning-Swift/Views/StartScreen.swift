//
//  StartScreen.swift
//  Learning-Swift
//
//  Created by Marc Miller on 12/20/25.
//

import SwiftUI

struct StartScreen: View {
    @Binding var nav: Navigation
    var body: some View {
        VStack (spacing: 15) {
            Text("Doodle Jump Clone")
                .font(.title)
            HStack {
                Button ("Play") {
                    nav.changePage(.Play)
                }
                .makeButton()
                Button ("Settings") {
                    nav.changePage(.Settings)
                }
                .makeButton()
            }
            HStack {
                Button ("Cosmetics") {
                    nav.changePage(.Cosmetic)
                }
                .makeButton()
            }
        }
    }
}

//#Preview {
//    StartScreen()
//}
