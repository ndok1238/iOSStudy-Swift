/*
 Extensions
 
 Extensions in Swift can:
 
 1. Add computed instance properties and computed type properties
 2. Define instance methods and type methods
 3. Provide new initializers
 4. Define subscripts
 5. Define and use new nested types
 6. Make an existing type conform to a protocol

 
 extension can extend an exsting type to make it adopt one or more protocols.
 
 */

// Computed Properties
extension Double{
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let onInch = 25.4.mm
let threeFeet = 3.ft


// Initializers
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

// you can extend the Rect structure to provide an additional initializer
extension Rect{
    init(center: Point, size: Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.width / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


//Methods
// Extensions can add new instance methods and type methods
extension Int{
    func repetitions(task: () -> Void){
        print("start")
        for _ in 0...self{
            print("in task")
            task()
        }
        print("done")
    }
}

4.repetitions(task: { print("Hello")})

extension Int{
    mutating func square(){
        self = self * self
    }
}


// Subscripts
extension Int{
    subscript(digitIndex:Int) -> Int{
        var decimalBase = 1
        for _ in 0..<digitIndex{
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

// Nested Types
extension Int{
    enum Kind{
        case negative, zero, positivie
    }
    var kind: Kind{
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positivie
        default:
            return .negative
        }
    }
}
