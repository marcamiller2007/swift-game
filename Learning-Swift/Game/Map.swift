//
//  Map.swift
//  Learning-Swift
//
//  Created by Marc Miller on 4/27/25.
//

// basically this is what will be displayed
// will have all objects stored within it
// will run all the game logic and stuff
class Map {
    
    var spritesInMap: [Sprite] = []
    var doodle: Sprite?
    var gravConst: Double
    
    init (gravConst: Double) {
        self.gravConst = gravConst
        
        // eh probably not necessary
    }
    
    func addSpriteToMap(_ sprite: Sprite) {
        spritesInMap.append(sprite)
    }
    
    func setDoodle(_ doodle: Sprite) {
        self.doodle = doodle
    }
    
    func updateSprites(_ timeElapsed: Double) {
        for sprite in spritesInMap {
            print(sprite.update(timeElapsed))
        }
    }
}
