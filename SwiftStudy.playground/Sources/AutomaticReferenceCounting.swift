/*
 AutomaticReferenceCounting
 Swift use ARC to track and manager your app's memory usage.
 this means that memory management 'just works' in Swift, and you do not need to think about memory management yourself.
 
 however, in a few cases ARC requires more information about the relationships between parts of your code in order to mangae memory for you.
 

 How ARC Works
 
 create instance of a class -> allocates a chunk of memory -> when an instance is no longer needed -> frees up the memory used by that instance
 
 however, if ARC were to deallocate an instance that was still in use, it would no longer be possible to access that instance's properites, or call that instance's methods.
 -> app crash!
 
 ARC tracks how many properties, constancts, and variables are currently referring to each class instance.
 
 to make this possible, whenever you assign a class instance to a property, constant, or variable, that property, constant, or variable makes a strong reference to the instance
 
 */

class Person {
    let name : String
    init(name: String){
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
