/*
 Nested Types
 
 
 */
struct BlackjackCard{
    enum Suit: String {
        case spades = "spade", hearts="heart", diamons = "diamond", clubs = "club"
    }
    enum Rank: Int{
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace
        struct Values{
            let first: Int, second: Int?
        }
        
        var values: Values{
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String{
        var output = "suit is \(suit.rawValue),"
        output += "values is \(rank.values.first)"
        if let second = rank.values.second{
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpade: \(theAceOfSpades.description)")


// Referring to Nested Type
// to use a nested type outside of its definition context, prefix its name with the name of the type it is nexted within
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
