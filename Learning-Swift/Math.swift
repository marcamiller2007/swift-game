//
//  Math.swift
//  Learning-Swift
//
//  Created by Marc Miller on 4/25/25.
//

class Math {
    static func sqr(_ num: Double) -> Double {
        return num * num
    }
    
    static func raiseTo(_ num: Double, _ exp: Int) -> Double {
        var product: Double = 1
        
        if num == -1 {
            if exp % 2 == 0 {
                return 1
            } else {
                return -1
            }
        }
        
        for _ in 1...exp {
            product *= num
        }
        
        return product
    }
    
    static func factorial (_ num: Int) -> Int {
        if num == 0 || num == 1 {
            return 1
        }
        
        return num * factorial(num - 1)
    }
    
    // This comment would be too long if I explain all of this
    // I have a picture of all the math somewhere
    // might be most accurate with degree = 2 ???????????
    static func sqrt(_ num: Double, _ degree: Int = 2) -> Double { // num = x
        let nearestSqrt: Double = findNearestSqrt(num) // = z
        let nearestSqr: Double = sqr(nearestSqrt) // = c
        
        var sum: Double = nearestSqrt + (num - nearestSqr) / (2 * nearestSqrt)
        
        if degree <= 1 {
            return sum
        }
        
        for n in 0...(degree - 2) {
            var numerator: Double
            var denominator: Double
            
            var product: Double = 1
            
            for _ in 0...n {
                product *= (1 + 2 * Double(n))
            }
            
            numerator = raiseTo(-1, n + 1) * raiseTo(num - nearestSqr, n + 2) * product
            denominator = raiseTo(2, n + 2) * Double(factorial(n + 2)) * raiseTo( nearestSqrt, 3 + 2 * n)
            
            sum += numerator / denominator
        }
        
        return sum
    }
    
    // angle will be in Radians
    static func sin(_ angle: Double, _ terms: Int = 3) -> Double {
        var sum: Double = 0
        
        for n in 0..<terms {
            let numerator: Double = raiseTo(-1, n) * raiseTo(angle, 2 * n + 1)
            let denominator: Double = Double(factorial(2 * n + 1))
            
            sum += numerator / denominator
        }
        
        return sum
    }
    
    // angle is still in radians
    static func cos(_ angle: Double, _ terms: Int = 3) -> Double {
        var sum: Double = 0
        
        for n in 0..<terms {
            let numerator: Double = raiseTo(-1, n) * raiseTo(angle, 2 * n)
            let denominator: Double = Double(factorial(2 * n))
            
            sum += numerator / denominator
        }
        
        return sum
    }
    
    // this one is very simple
    static func tan(_ angle: Double, _ terms: Int = 3) -> Double {
        return sin(angle, terms) / cos(angle, terms)
    }
    
    // kinda basic
    static func naturalExp(_ num: Double, _ degree: Int = 3) -> Double {
        
        // first two terms
        // first degree
        var sum: Double = 1 + num
        
        if degree <= 1 {
            return sum
        }
        
        // first iteration is the 2nd degree
        // this is why the "+ 2" exists
        for n in 0..<degree {
            sum += raiseTo(num, n + 2) / Double(factorial(n + 2))
        }
        
        return sum
    }
}

// returns the nearest square root of the number given as an argument
// DOES NOT RETURN A SQUARE
func findNearestSqrt(_ num: Double) -> Double {
    var i: Double = 0
    var current: Double = 0
    var next: Double = 0
    
    while(true) {
        
        if (current + 0.5 * (next - current)) >= num {
            return i
        } else if next > num {
            return i + 1
        }
        
        
        i += 1
        current = Math.sqr(Double(i))
        next = Math.sqr(Double(i + 1))
    }
}
