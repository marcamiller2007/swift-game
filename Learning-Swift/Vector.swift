//
//  Vector.swift
//  Learning-Swift
//
//  Created by Marc Miller on 4/21/25.
//

struct Vector {
    var x: Double
    var y: Double
    
    //to String
    public var description: String {
        return "[\(x), \(y)]"
    }
    
    init(_ x: Double = 0, _ y: Double = 0) {
        self.x = x
        self.y = y
    }
    
    func add(_ other: Vector) -> Vector {
        return Vector(x + other.x, y + other.y)
    }
    
    mutating func change(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
    
    func getMagnitude() -> Double {
        return Math.sqrt(
            (Math.sqr(x)) + (Math.sqr(y))
        )
    }
}
