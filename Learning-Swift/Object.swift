//
//  Object.swift
//  Learning-Swift
//
//  Created by Marc Miller on 4/21/25.
//

//Object that can move around given different forces
class Object {
    
    // Constants
    let mass: Double
    let gravConst: Double = 6.67430E-11
    
    // Variables
    var forces: [Vector] = []
    var aVector: Vector
    var vVector: Vector
    var position: Vector
    
    // to String
    public var description: String {
        return "forces: \(forces), aVector: \(aVector), vVector: \(vVector), position: \(position)"
    }
    
    
    init(
        mass: Double = 1,
        aVector: Vector = Vector(0, 0),
        vVector: Vector = Vector(0, 0),
        position: Vector
    ) {
        self.mass = mass
        self.aVector = aVector
        self.vVector = vVector
        self.position = position
    }
    
    //adds a new force to the object
    //returns the new force's index
    func addForce(_ force: Vector) -> Int {
        forces.append(force)
        return forces.count - 1
    }
    
    //alters a specific force
    //returns -1 if index is invalid and 1 if it is valid
    func changeForce(_ index: Int, _ newForce: Vector) -> Int {
        if index >= forces.count {
            return -1
        }
        
        forces[index] = newForce
        return 1
    }
    
    //removes a force at an index
    //returns -1 if invalid index and the new size of forces if it is valid
    func removeForce(_ index: Int) -> Int {
        if index >= forces.count {
            return -1
        }
        
        forces.remove(at: index)
        return forces.count
    }
    
    //returns resultant vector of forces
    func sumForces() -> Vector {
        var resultantVector: Vector = Vector(0, 0)
        
        for force in forces {
            resultantVector = resultantVector.add(force)
        }
        
        return resultantVector
    }
    
    // updates all vectors describing the motion of the object
    // Acceleration
    // Velocity
    // Position
    func update(_ timeElapsed: Double) -> Vector {
        let netForce: Vector = sumForces()
        
        aVector.change(netForce.x / mass, netForce.y / mass)
        vVector.change(
            vVector.x + aVector.x * timeElapsed,
            vVector.y + aVector.y * timeElapsed
        )
        position.change(
            position.x + vVector.x * timeElapsed,
            position.y + vVector.y * timeElapsed
        )
        
        return position
    }
    
}
