/*
 Optional Chaining
 
 Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil.
 
 */


class Person {
    var residence: Residence2?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person() // this time, residence id iniyislized to 'nil'
//so below code will occur error
//let roomCount = john.residence!.numberOfRooms

// Optional chaining provide an alternative way to access the value
if let roomCount = john.residence?.numberOfRooms {
    print("this instance is not nil")
}else {
    print("this instance is nil")
}


/*
 Defining Model Classes for Optional Chaining
 
 
 */

class Room{
    let name: String
    init(name: String) {self.name = name}
}

class Address{
    var buildingName : String?
    var buildingNumber : String?
    var street: String?
    func buildingIdentifier() -> String?{
        if let buildingNumber = buildingNumber, let street = street{
            return "\(buildingNumber) \(street)"
        }else if buildingName != nil {
            return buildingName
        }else {
            return nil
        }
    }
}

class Residence2{
    var rooms = [Room]()
    var numberOfRooms: Int{
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    
//    If you call this method on an optional value with optional chaining, the method’s return type will be Void?, not Void,
    func printNumberOfRooms(){
        print("the number of rooms is \(numberOfRooms)")
    }
    
    
    var address: Address?
}


let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}

john.residence?.address = createAddress()

// if call void return type on an optional chaining return void?
// so you can do below codes
if john.residence?.printNumberOfRooms() != nil {
    print("print method is not nil")
}else {
    print("print method is nil")
}


/*
 Accessing subscripts Through Optional Chaining
 */

if let firstRoomName = john.residence?[0].name{
    print("the first room name is \(firstRoomName)")
}else {
    print("unable to retrieve the first room name.")
}

// similarly, you can try to set a new value through a subscript with optional chaining
// but residence is nil so, it will fail
john.residence?[0] = Room(name: "Bathroom")

let johnHouse = Residence2()
johnHouse.rooms.append(Room(name: "Living Room"))
johnHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnHouse

if let firstRoomName = john.residence?[0].name{
    print("the first room name is \(firstRoomName)")
}else {
    print("unable to retrieve the first room name.")
}


/*
 Accessing Subscripts of Optional Type
 
 */
