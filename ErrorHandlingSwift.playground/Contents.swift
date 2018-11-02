/*
 Error Handling
 
 swift provide first-class support for throwing catching, propagating, and manipulating recoverable error at runtime
 
 enumerations are particularly well suited to modeling a group of related error conditions
 
 */
enum VendingMachineError: Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

/*
 Throwing an error lets you indicate that something unexpected happend and the normal flow of execution can't continue.
 you use a throw statement to throw an error
 */
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5) // occur error



/*
 there are hour ways to handle error in Swift.
 propagate the error form function to the code that calls that function
 handle the error using a 'do-catch' statement
 handle the error as an 'optional value' or 'assert'
 
 */


/*
 Propagating Errors Using Throwing Functions
 function marked with throw is called a throwing function.
 
 func canThrowError() throws -> String
 func cannotThrowErrors() -> String
 
 A throwing function propagates error that are thrown inside of it to the scopre form which it's called
 */

struct Item{
    var price: Int
    var count: Int
}
class VendingMachine{
    var inventory = [
        "CandyBar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws{
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispendsing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "CandyBar"
    try vendingMachine.vend(itemNamed: snackName)
}

// Throwing initializers can propagate erros in the same way as throwing function.
struct PurchasedSnack {
    let name : String
    init(name:String, vendingMachine:VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}


/*
 Handling Error Using Do-Catch
 You use a do-catch statement to ahdnle errors by running a block of code.
 general form of a do-catch
 
 do{
    try expression
    statements
 }catch pattern 1{
    satetements
 }catch pattern 2 where condition{
    statements
 }catch {
    staetmetns
 }
 
 you write a pattern after catch to indicate what error that clause can handle
 */

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do{
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("success! Yum.")
}catch VendingMachineError.invalidSelection{
    print("Invalid Selection")
}catch VendingMachineError.outOfStock {
    print("Out of Stock")
}catch VendingMachineError.insufficientFunds(let coinsNeeded){
    print("Insufficient funds. please insert an additional \(coinsNeeded) coins")
}catch {
    print("Unexpected error: \(error)")
}


/*
 Converting Errors to Optional Values
 
 you use try? to handle an error by converting it to an optional value.
 if an error is thrown while evaluating the try? expression, the value of the expression is nil
 */
//func someThrowingFunction() throws -> Int{
//    // ....
//}
//
//let x = try? someThrowingFunction()
//
//let y: Int?
//do {
//    y = try someThrowingFunction()
//}catch {
//    y = nil
//}

var i = 1
func processFile() throws {
    print("in first function")
    if i == 1 { return }
    
    defer{
        print("in defer")
    }
    
    print("before defer")
}

try! processFile()
