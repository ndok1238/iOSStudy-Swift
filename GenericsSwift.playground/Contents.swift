/*
 Generics
 
 generic code enables you to write flexible, resuable functions and type0s that can work with any type, subejct to requiremtns that you define.
 
 
 */


/*
 The Problem That Generics Solve
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int){
    // a, b 는  inout 이기때문에 참조형 변수로서 원본과 동일한 주소를 참조
    // a, b 를 변경하면 원본데이터 또한 변경됨
    let temporaryA = a
    a = b
    b = temporaryA
    // 리턴해 주지 않아도 원본데이터는 변경되어 있음
}
var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print(someInt)
print(anotherInt)
// 매개변수가 Int 로 선언 되었기 때문에 Int 변수만 사용 가능

// String 변수를 사용하기 위해서는 또 다른 함수를 작성해야함 -> 번거로움

// 타입을 T 로서 선언함으로 모든 타입에서 사용 가능
func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}



/*
 Type Parameters
 in ex example, T is an example of a type parameter
 Type Parameters specify and name a placeholder type, and are written immediately after the function's name, between a pair of matching angle brackets
 */


/*
    Generic Types
 in addition to generic functions, Swift enables you to define your own generic types.
 
 */

struct Stack<Element>{
    var items = [Element]()
    mutating func push(_ item: Element){
        
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = Stack<String>()
stackOfString.push("uno")
stackOfString.push("dos")
stackOfString.push("tres")
stackOfString.push("cuatro")
stackOfString.pop()



/*
 Extending a Generic Type
 When you extend a generic type, you don't provide a type parameter list as part of the extension's definition.
 Instead, the type parameter list from the origianl type definition is available within the body of the extension, and the original type parameter names are used to refer to the type parameters from the original definition
 */

extension Stack{
    var toItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}




/*
 Type Constraints
 theese Functions with Generics can work with any type.
 but, it's sometimes useful to enforce certain type constarints on the types that can be used with generic functions and generic types
 
 for exampel, Swift's dictionary type places a limitation on the types that can be used as keys for a dictionary.
 Dictionary needs its keys to be hashable so that it can check whether it already contains a value for a particular key. Without this requirement, Dictionary could not tell whether it should insert or replace a value for a particular key, nor would it be able to find a value for a given key that is already in the dictionary


 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, SomeU: U){}
 
 */

func findIndex(ofString valueToFind: String, in array: [String]) -> Int?{
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

// to generic

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


/*
 Associated Types
 When defining a protocol, it's sometimes useful to declare one or more associated types as part of the protocol's definition.
 An associated type gives a placeholder name to a type that is used as part of the protocol.
 The actual type to use for that associated types are specified with the associatedtype keyword.
 */

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}


// Generic Subscript
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}
