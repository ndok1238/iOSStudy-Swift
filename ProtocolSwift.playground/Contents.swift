
/*
 Protocol
 
 A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
 
 
 
 */

// Property Requirements
protocol SomeProtocol{
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocl{
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "john appleseed")


class Starship: FullyNamed {
    var prefix:String?
    var name : String
    init(name: String, prefix:String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String{
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")


// Method Requirements
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator{
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("here's a random number: \(generator.random())")
print("and another random number: \(generator.random())")

// mutating method requirements

protocol Togglable{
    mutating func toggle()
}
enum OnOffSwitch: Togglable{
    case off, on
    mutating func toggle(){
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}


//Initializer requirements
protocol SomeProtocol2{
    init(someParameter: Int)
}

class SomeCLass: SomeProtocol2{
    required init(someParameter: Int){
        
    }
}




/*
  Protocols as Types
  protocol don't actually implement any functionality themselves.
  any protocol you create will become a fully-fledged type for use in your code
 
 As a parameter type or return type in a function, method, or initializer
 As the type of a constant, variable, or property
 As the type of items in an array, dictionary, or other container
 */
class Dice{
    let sides: Int
    let generator: RandomNumberGenerator
  
    init(sides:Int, generator:RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int{
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}



/*
 Delegation
 delegation is a desing pattern that enables a class or structure to hand off some of its responsibilities to an instance of another type.
 
 */

protocol DiceGame{
    var dice: Dice{ get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}


class SnakesAndLadders: DiceGame{
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init(){
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate : DiceGameDelegate?
    
    func play(){
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate{
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int){
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("the game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()


/*
 Adding Protocol Conformance with an Extension
 
 you can extend an exsting type to adopt and conform to a new protocol, even if you don't have access to the source code for the existing type.
 
 */

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides) - sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable{
    var textualDescription : String{
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}


/*
 Conditionally Conforming to a Protocol
 A generic type may be able to satisfy the requirements of a protocol only under certain conditions, such as when the type's generic parameter conform to the protocol.
 
 
 */

//extension Array: TextRepresentable where Element: TextRepresentable {
//    var textualDescription: String {
//        let itemsAsText = self.map { $0.textualDescription }
//        return "[" + itemsAsText.joined(separator: ", ") + "]"
//    }
//}
//let myDice = [d6, d12]
//print(myDice.textualDescription)

/*
 Declaring Protocol Adoption with an Extension
 
 */
struct Hamster {
    var name: String
    var textualDescription: String{
        return "A hamster rnamed \(name)"
    }
}
extension Hamster: TextRepresentable{}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster

print(somethingTextRepresentable.textualDescription)


/*
 Collections of Protocol Types
 A protocol can be used as the type to be stored in a collection such as an array or a dictionary
 */

let things: [TextRepresentable] = [game, d12, simonTheHamster]
for thing in things{
    print(thing.textualDescription)
}



/*
 Protocol Inheritance
 A protocol can inherit one or more other protocols and can add further requirements on top of the requirements it inherits.
 
 protocol InheritingProtocol: SOmeProtocol, AnotherProtocl{
    protocol definition goes here
 }
 */

protocol PrettyTextRepresentable:TextRepresentable{
    var prettyTextualDescription: String{ get }
}

extension SnakesAndLadders: PrettyTextRepresentable{
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)


/*
 Class-Only-Protocols
 You can limit protocol adoption to class types(and not structures or enumerations) by adding the AnyObject protocol to a protocl's inheritance list.
 
 Protocol Composition
 
 */
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person2: Named, Aged{
    var name : String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = Person2(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City : Location, Named{
    var name : String
    init(name: String, latitude: Double, longitude: Double){
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named){
    print("Hello, \(location.name)!")
}
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)


/*
 Checking for Protocol Conformance
 
 you can use the 'is' and 'as' operators described in Type Casting to check for protocol conformance, and to cast to a specific protocol.
 */

protocol HasArea{
    var area: Double { get }
}

class Circle: HasArea{
    let pi = 3.1415927
    var radius: Double
    var area: Double{ return pi * radius * radius }
    init(radius: Double) {self.radius = radius}
}
class Country: HasArea{
    var area:Double
    init(area: Double) { self.area = area}
}

class Animal {
    var legs: Int
    init(legs: Int){ self.legs = legs}
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects{
    if let objectWithArea = object as? HasArea{
        print("Area is \(objectWithArea)")
    }else {
        print("Something that doesn't have an area")
    }
}


/*
 Optional Protocol Requirements
 you can define optional requirements for protocols, These reuiqrements don't have to be implemented by types that conform to the protocol.
 Optional requirements are prefixed by the optional modifier as part of the protocl's definition.
 
 protocol and the optional requirement must be marekd with the '@objc'
 */

@objc protocol CounterDataSource{
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment(){
        if let amount = dataSource?.increment?(forCount: count){
            count += amount
        }else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}
