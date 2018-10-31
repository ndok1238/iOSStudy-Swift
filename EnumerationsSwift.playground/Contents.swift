/*
 Enumerations
 
 열거형은 관련있는 값들의 그룹에 대한 일반적인 타입을 정의, 이를 이용하여 코드 안에서 타입에 안전한 방법으로 작업할 수 있다
 
 enum 키워드로 작성, 중괄호안에 모든 정의를 집어 넣음
 enum SomeEnumeration {
    enumeration definition goes here
 }
 */
// enum 정의 1
enum CompassPoint{
    case North
    case South
    case East
    case West
}

// enum 정의 2
enum Planet{
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

// 열거형의 값들과 스위치 구문간의 대응
var directionToHead = CompassPoint.South
directionToHead = .East
switch directionToHead{
case .North:
    print("north")
case .South:
    print("south")
case .East:
    print("east")
case .West:
    print("west")
}

// 값과 연관지어 정의
enum Barcode{
    case UPCA(Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909_51226, 3)

switch productBarcode {
case .UPCA(let numberSystem, let identificer, let check):
    print("UPC_A with value of \(numberSystem)")
case .QRCode(let productCode):
    print("QRCode with value of \(productBarcode)")
}

// 원시 값ㅇ르 가지는 열거형

enum Planet2: Int{
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthOrder = Planet2.Earth.rawValue
let possiblePlanet = Planet2(rawValue: 5)

