/*
 Type Casting
 
 Type casting is a way top check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy
 type casting is implemented with the 'is' and 'as' .
 
 */


class MediaItem {
    var name : String
    init(name: String){
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem{
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


// Check Type
var movieCount = 0
var songCount = 0
var mediaCount = 0
for item in library{
    if item is Movie{
        movieCount += 1
    } else if item is Song{
        songCount += 1
    }
    
    if item is MediaItem{
        mediaCount += 1
    }
}


// downcast
for item in library{
    if let movie = item as? Movie{
        print("Moview: \(movie.name), dir. \(movie.director)")
    }else if let song = item as? Song{
        print("Song: \(song.name), by \(song.artist)")
    }
}

print("Media libaryr contains \(movieCount)  movies and \(songCount) songs")



/*
 Type Casting for Any and AnyObject
 
 Swiftr provide two special types for working with nonspecific types
 
 Any : can represent an instance of any type at all, including function types.
 AnyObject : can represent an instance of any class type.
 
 */


// uses 'Any'
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(42.123123)
things.append("hello")
things.append((30.1,1.2))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({(name: String) -> String in "Hello, \(name)"})

for thing in things{
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0 :
        print("a positive double value of \(someDouble)")
    case is Double:
        print("someother double value that i don't want to print")
    case let someString as String:
        print("a string value of \(someString)")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }

}
