//
//  Sprite.swift
//  Learning-Swift
//
//  Created by Marc Miller on 5/7/25.
//

class Sprite: Object {
    
    var texture: Int
    // stores the index of the image to be used as a texture
    
    init (
        texture: Int,
        mass: Double = 1,
        aVector: Vector = Vector(0, 0),
        vVector: Vector = Vector(0, 0),
        position: Vector
    ) {
        self.texture = texture
        super.init(
            mass: mass,
            aVector: aVector,
            vVector: vVector,
            position: position
        )
    }
}
