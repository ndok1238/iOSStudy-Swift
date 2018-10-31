/*
 흐름 제어
 
 Swift에서는 switch문이 'fall through'하지 않음
 -> fall through란 switch 에서 한 case 를 처리하고 다른 case로 넘어가는 것. == break 할 필요가 없다
 또한, case에 대해 여러 종류의 pattern-matching을 사용할 수 있다
 수의 범위 match, 튜플 match, casts to a specific type.
 
 */

/*
 For
 - for-in  : 범위나 sequence, collection, progression 에 대해 이 안에 있는 각 항목에 대해서 코드를 실행
 - for-condition-increment : 특정 조건부가 참이 될 때 까지 코드를 실행
 */
// For-in
for index in 1...5{
    print("index : \(index )")
}

// index 가 필요 없다면 언더바를 이용
let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer += base
}
print("\(answer)")

// for-condition-increment
// -> 삭제 됨!
//for var index = 0 ; index<3; ++index{
//    print("\(index)")
//}


/*
 While loops
 while condition{
    statements
 }
 */
let finalSquare = 25
var board = [Int](repeating: 0, count: (finalSquare + 1) )
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    square += diceRoll
    if square < board.count{
        square += board[square]
    }
}
("Game over!")

// Do-While
// 조건문을 검토하기전에 루프블록을 한번 실행 함




/*
 조건문
 조건수가 많지 않을때는 if
 조건의 종류가 다양하고 복잡할때는 switch
 */

// Switch
// 범위로 매치하기
let count = 3_000_000_000_000
let countedThings = "start in the Milky Way"
var naturalCount : String = ""
switch count {
    
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999 :
    naturalCount = "hundreds of"
case 1000...999_999:
    naturalCount = "thousands of"
default:
    naturalCount = "millions and millions of"
    print("there are \(naturalCount)")
    
}

// 튜플 사용하기
let somePoint = (1,1)
switch somePoint {
case (0, 0):
    print("원점")
case (_,0):
    print("x 축 선상")
case (0,_):
    print("y 축 선상")
case (-2...2, -2...2):
    print("상자 안에")
default:
    print("상자 밖에")
}


// 값을 상수와 묶기,  -> 바인딩하기
let anotherPoint = (2, 0)
switch anotherPoint{
case (let x, 0):
    print("x 축상 x : \(x)")
case (0, let y):
    print("y 축상 y : \(y)")
case let (x, y):
    print("x,y : \(x),\(y)")
}

// where 절 사용하기
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("\(x), \(y) is equality")
case let (x, y) where x == -y:
    print("\(x), \(y) is - equality")
case let (x, y):
    print("etc...")
}


// 흐름제어 이동문
// Continue
// 루프에게 현재 하고 있는 것을 멈추고, 루프의 다음번 이터레이션을 시작하라고 명령
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
    print(puzzleOutput)
}

// Break
// 흐름제어문 전체를 즉시 종료시킴 break문은 스위치문이나 루프문 안에서 사용

// 루프문안에서쓴 break
// 루프의 실행을 즉시 종료시키고, 루프를 닫는 중괄호뒤에 나오는 코드로 코드 실행을 이동
// berak 뒤에 있는 나머지 코드부분은 이터레이션을 돌지 않는다. 그리고 그다음 이터레이션 또한 시작되지 않는다.

// switch 문 안에서 쓴 break
// switch 문 전체를 즉시 종료, switch 문이 끝나는 부분 이후로 이동 시킴
// 주로 특정 케이스에서 아무것도 하지 않을때 쓰임


// 이름표가 붙은 구문 (Labeled Statements)
square = 0
diceRoll = 0
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}

