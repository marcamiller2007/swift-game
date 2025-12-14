//
//  Game.swift
//  Learning-Swift
//
//  Created by Marc Miller on 5/9/25.
//


// ASSUMPTION:
// width: 400
// height: 800

class Game {
    var timeElapsed: Double = 0
    var timeMultiplier: Double = 1
    
    // as timeElapsed increases time multiplier will also increase
    
    var spritesInMap: [Sprite] = []
    var doodle: Sprite
    
    init () {
        
        // creates our doodle (player controlled character
        
        let doodle: Sprite = Sprite(
            texture: 1,
            mass: 100,
            aVector: Vector(0, 0),
            vVector: Vector(0, 0),
            position: Vector(200, 0),
        )
        
        doodle.addForce(Vector(0, -9.81 * doodle.mass))
        
        self.doodle = doodle
        
        // creates the initial platforms
        
        for _ in 0..<20 {
            let platform: Sprite = Sprite(
                texture: 2,
                mass: 0,
                aVector: Vector(0, 0),
                vVector: Vector(0, 0),
                position: Vector(
                    Double.random(in: 0...400),
                    Double.random(in: 0...800)
                )
            )
            
            addSpriteToMap(platform)
          
        }
    }
    
    func addSpriteToMap(_ sprite: Sprite) {
        spritesInMap.append(sprite)
    }
    
    func updateSprites(_ timeElapsed: Double) {
        for sprite in spritesInMap {
            print(sprite.update(timeElapsed))
        }
    }
    
    func tick(_ dt: Double) -> Void{
        updateSprites(dt * timeMultiplier)
        
        timeElapsed += dt
        
        // Need to figure out a function to increase timeMultiplier idk rn tho...
        // Ok so it'll start out as lineraly increasing over the first two intervals
        // Then it will start quadratically increasing with a linear component
        
        if (timeElapsed < 30) {
            timeMultiplier = 1 + 0.01 * timeElapsed
        }
        else if (timeElapsed >= 30 && timeElapsed < 60) {
            timeMultiplier = 1.3 + 0.02 * (timeElapsed - 30)
        }
        else {
            timeMultiplier = 1.9 + (timeElapsed / 2000) * (timeElapsed - 60)
        }
        
        
    }
}
