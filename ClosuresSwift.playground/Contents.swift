
/*
 클로저
 클로저는 사용자의 코드 안에서 전달되거나 사용할 수 있는 기능을 포함한 독립적인 블록
 
 전역 및 중첩 함수들은 사실 클로저의 특수한 경우들!
 클러저는 아래의 세가지중 하나의 형태
 1. 전역 함수는 이름이 있지만 아무 값도 회득하지 않는 클로저
 2. 중첩 함수들은 이름이 있고, 내부의 함수의 값을 획득할 수 있는 클로저
 3. 클로저 표현식은 자신을 둘러싼 컨텍스트에서 값을 획득 할 수 있는 가벼운 문법으로 작성된 클로저
 -> 뭔가 어렵...
 
 
 */


/*
  클로저 표현식 문법
 {(parameters) -> return type in
    statements
 }
 */
// ex)
var names:Array = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

names.sort(by:{(s1: String, s2: String)-> Bool in
    return s1 < s2
})

/*
 컨텍스트로부터 타입 유추하기 (Inferring Type From Context)
 
 */
names.sort(by:{s1, s2 in return s1 > s2})
print(names)




// 후행 클로저 인자
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map{
    (number:Int) -> String in
    var output = ""
    var value = number
    while value > 0 {
        output = digitNames[value % 10]! + output
        value /= 10
    }
    return output
}
print(strings)



func makeIncrementor(forIncrement amount: Int) -> () -> Int{
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementByTen()
incrementByTen()
incrementByTen()
incrementByTen()
incrementBySeven()
incrementBySeven()
incrementByTen()
//incrementByTen()

