/*
 
 swift 는 c, objective-c 의 좋은 점들을 취합한 것을 기반으로 ios와 osx앱을 개발하기 위한 언어
 arc 채용
 
 
 */


/*
 1. basic value
 */

// 변수 사용하는데 정의하는 키워드는 2가지, let, var
// let : 상수를 만듦 -> 한반먼 값을 할당
// var : 변수를 만듦 -> 값을 변경할 수 있음
var myVariable = 42
myVariable = 50
let myConstant = 42

// 타입 지정
// 타입이 지정되어 있지 않으면 컴퍼알리거 해당 값의 타입을 추측 -> 꼭 지정해야 하는 것은 아님
let inplicitInteger = 70
let implicitDouble = 7.0
let explicitDouble : Double = 70

//  실습 1. : 명시적으로 Float 타입인 상수를 만들고 4라는 값을 할당
let myFirstTest : Float = 4

// 타입이 정의되면 다른 타입의 값으로 암시적인 변환은 불가능 하다!
let label = "this is string"
let width = 94
let widthLabel = label + String(width)
//let widthLabel2 = label + width   <- 에러 발생 구간

// array and dictionary
// 대괄호를 이용해서 쉽게 만들 수 있다.
// array
var shoppingList = ["catfish", "water", "tulips","blue paint"]
shoppingList[1] = "bottle of water"
print(shoppingList)
// dictionary
var occupations = [
    "Malcolm" : "Captian",
    "Kaylee" : "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print(occupations)
// 비어 있는 배열과 딕셔너리 생성
//let emptyArray = String[]()
let emptyDictionary = Dictionary<String, Float>()
//print(emptyArray)
print(emptyDictionary)

/*
 2. 흐름 제어
 */

// if, switch, for-in, for, while, do-while

// if, for
let individualScore = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScore {
    if score > 50{
        teamScore += 3
    }else{
        teamScore += 1
    }
}
teamScore

// 빈값을 가지고 if와 let을 함께ㅐ 사용하는 것도 가능 -> 이런 빈 값들은 옵션('?')으로 표현
var optionalString: String? = nil
optionalString == nil

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello, \(name)"
}
if let nilString = optionalString {
    print("optional var : \(nilString)")
}else{
    optionalString = "not nil"
    
}

//switch
let vegetable = "red pepper"
switch vegetable{
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "that would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "IS it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

// for-in
let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Aquare":[1,4,9,16,25],
]

var largest = 0
for (kind, numbers) in interestingNumbers{
    for number in numbers{
        if number > largest{
            largest = number
        }
    }
}
largest

// 2. 실습 어떤 숫자가 가장 큰 수로 저장되는지 확인하기 위해 다른 변수를 추가하고, 가장 큰 수로 저장된 숫자가 무엇이지 확인해보라.
// 뭔말??


//while
var n = 2
while n < 100{
    n = n*2
}
n
// do while ->> repeat while 로 변함
var m = 2
repeat {
   m = m * 2
}while m < 2
m

// 반복문 안에 ..을 사용해 인덱스의 범위를 만들거나 명시적으로 초기화, 조건문, 증감식을 사용
var firstForLoop = 0
for i in 0..<3 {
    firstForLoop += i
}
firstForLoop

// 이런 형식의 for문은 swift 3 에서 삭제됨
//for var i = 0 ; i < 3 ; i++ {
//    secondForLoop += 1
//}


/*
 3. 함수와 클로져
 */

func greet(name:String, day:String) -> String{
    return "Hello \(name), today is \(day)."
}
greet(name:"Bob", day:"Tuesday")

// tuple을 리턴 타입으로 사용할 수 있다.
func getGasPrices() -> (Double, Double, Double){
    return (3.59, 3.69, 3.79)
}
getGasPrices()

// 매개변수로 배열을 사용 할 수 있다.
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers:42, 597, 12)

// 실습! 인자들의 평균값을 계산하는 함수를 만들자
func avgOf(numbers: Int...) -> Float {
    var count = numbers.count
    var sum = 0
    for number in numbers {
        sum += number
    }
    var avg:Float = (Float)(sum / count)
    return avg
}
avgOf(numbers:42, 597, 12)


// 중첩함수
// 코드가 길어지고 복잡해지는 함수라면 이를 정리하기우해 중첩함수를 사용 가능
func returnFifteen() -> Int{
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}

returnFifteen()

// 함수는 최상위 타입! -> 어떤 함수가 다른 함수를 반환값 형태로 반환 가능
func makeIncrementer() -> ((Int) -> Int){
    func addOne(number:Int) -> Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// 함수는 다른 함수를 인자로 받을 수 있음
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool{
    return number < 10
}
var numbers = [10, 12, 14, 15]
hasAnyMatches(list: numbers, condition: lessThanTen)

// 함수는 클로저의 특별한 예!! 이름없는 함수가 클로저이다
numbers.map({
    (number: Int) -> Int in
        let result = 3 * number
        return result
})
// 실습 모든 홀수값에 대해 0을 반환하도록 클로저를 수정
numbers.map({
    (number: Int) -> Int in
    let checker = number % 2
    if(checker == 1){
        return 0
    }else{
        return number
    }
})

/*
 4. 객체와 클래스
 */
// 클래스를 정의할때 class 키워드를 사용
class Shape {
    var numberOfSides = 0
    func SimpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}
// 클래스의 객체화
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.SimpleDescription()

// 클래스의 구성에서 중요한 것은 클래스사 생성될때 초기화하는 초기화자! init 키워드로 정의
// 클래스 내의 속성은 반드시 값을 할댕해 줘야한다.(옵셔널은 제외)
class NamedShape{
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        self.numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()



// 실습!! NamedShape 의 하위클래스인 Circle을 만들자.
// 이니셜 라이저를 통해 radius 와 name을 이자로 받으며 Circle 클래스 안에 area, describe 함수를 구현해보자
class Circle: NamedShape{
    var radius:Double
    
    init(name:String, radius:Double){
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double{
        return (3.14 * (radius * radius))
    }
    
    func describe() -> String{
        return "A shape with and area : \(area())"
    }
}

let circle = Circle(name:"circle1", radius:4.2)
circle.area()


// 속성은 getter와 setter를 가질 수 있다
class EquilateralTriangle: NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength;
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get{
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength



/*
 5. 열거형과 구조체
 */
// enum 키워드로 열거형을 정의
enum Rank: Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String{
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
    
    func toRaw() -> Int{
        switch self {
        case .Ace:
            return 1
        case .Two:
            return 2
        case .Three:
            return 3
        case .Four:
            return 4
        case .Five:
            return 5
        case .Six:
            return 6
        case .Seven:
            return 7
        case .Eight:
            return 8
        case .Nine:
            return 9
        case .Ten:
            return 10
        default:
            return 10
        }
    }
    
    func fromRaw() -> Rank {
        return .Ace
    }
    
    func compareWithRank(other:Rank) -> Int{
        if(self.toRaw() > other.toRaw()){
            return 1
        }else if(self == other){
            return 0
        }else {
            return -1
        }
    }
    
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()

// 열거형의 구성값들은 실제 값을 쓰는 다른 방법일 뿐, 실제 값이다. 실제 값이 의미있는 경우가 아니라면 굳이 첫번째 값을 제공할 필요가 없다.
enum Suit{
    case Spade, Hearts, Diamonds, Clubs
    func simpleDescription() -> String{
        switch self {
        case .Spade:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        default :
            return "wrong type"
        }
    }
    func color() -> String{
        switch self {
        case .Spade, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        default:
            return "wrong type"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

// 구조체
// struct 키워드를 이용해서 구조체를 정의
// 클래스와 구조체의 가장 중요한 차이점 중 하나는 구조체의 경우 코드 내에서 전달될 때 값 복사 형태로 전달되지만
// 클래스의 경우 참조복사 형태로 전달된다는 것

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func createCard(rank:Rank, suit:Suit) ->Card{
        return Card(rank:rank, suit:suit)
    }
    
}
let threeOfSpade = Card(rank: .Three, suit: .Spade)
let threeOfSpadeDescription = threeOfSpade.simpleDescription()



/*
 프로토콜과 확장
 */
// 프로토콜
// protocol 키워드로 정의
protocol ExampleProtocol {
    var simpleDescription: String{ get }
    mutating func adjust()
}
// 클래스, 열거형, 구조체 모두에 프로토콜을 사용할 수 있음
class SimpleClass: ExampleProtocol{
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 15123
    func adjust() {
        simpleDescription += "Now 100% adjusted"
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription


// 구조체를 수정하기 윟 ㅐ사용되는 메서드를 표시하기위해 mutating 키워드를 사용
// 클래스 안에 있는 모든 메서드들은 항상 클래스를 수정할 수 있기때문에 mutating을 사용할 필요 없음
struct SimpleStructure: ExampleProtocol{
    var simpleDescription: String = "A simple structure"
    mutating func adjust(){
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDestriction = b.simpleDescription


// Extension
// extension 키워드를 사용해서 기존의 타입들에 새로운 메서드나 속성들을 비교하기 위한 기능들을 추가
// 타입이 선언된 곳 어디서든 extension 키워드를 사용해 프로토콜을 적용할 수 있음
// --> 이미 만들어진 클래스들의 기능을 확장하여 사용할때 extension 키워드를 사용
extension Int: ExampleProtocol{
    var simpleDescription: String{
        return "The number \(self)"
    }
    mutating func adjust(){
        self += 42
    }
}
7.simpleDescription


// 프로토콜 이름은 다른 알려진 변수들 처럼 지정할 수 있음
// 단 ExampleProtocol 에 정의된 것만 사용 할 수 있다.
let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
// protocolValue.anotherDescription  // 이 경우는 SimpleClass에 정의된 속성이기 때문에 ExampleProtocol 타입에선 사용 불가능


/*
 6. 제네릭
 */
// 제네릭 함수나 타입을 만들려면 꺽쇠안에 이름을 쓰면 됨
func repeat_method<ItemType>(item: ItemType, times: Int) -> [ItemType]{
    var result = [ItemType]()
    for _ in 0...times{
        result.append(item)
    }
    return result
}
repeat_method(item:"knock", times:4)

// 클래스, 열거형, 구조체와 마찬가지로 함수나 메서드를 제네릭 형태로 만들 수 있음
enum OptionalValue<T>{
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = . None
possibleInteger = .Some(100)

