//
//  MainThread.swift
//  Learning-Swift
//
//  Created by Marc Miller on 5/9/25.
//
import SwiftUI

class MainThread {
    static func go(fps: Double) {
        let framDelay: Double = 1.0 / fps
        
        while true {
            sleep((useconds_t)(framDelay * 1_000_000))
            // I'm really not sure if this will work
            
            // This will be a method to constantly
            //update the game with all the collisions
            //and such
            
        }
    }
    
}
