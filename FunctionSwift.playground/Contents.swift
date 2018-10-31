/*
 Functions
 
 함수는 특정 일을 수행하는 자기 완결성을 가진 코드들의 집합
 
 
 함수 정의와 호출
 
 */
func sayHello(personName: String) -> String{
    let greeting = "Hello, " + personName + "!"
    return greeting
}
print(sayHello(personName: "cha"))

// 파라메터 복수 입력
func halfOpenRangeLength(start: Int, end: Int) -> Int{
    return end - start
}
print(halfOpenRangeLength(start: 1, end: 10))

// 파라메터가 없는 함수
func sayHelloWorld() -> String{
    return "ehllo, world"
}
print(sayHelloWorld())

//반환 값이 없는 함수
func sayGoodBye(personName : String){
    print("Goodby \(personName)")
}

// 여러개의 반환값을 가지는 함수
func count(string: String) -> (vowels: Int, consonants: Int, others: Int){
    var vowels = 0, consonants = 0, others = 0
    for character in string{
        switch character {
        case "a", "e", "i","o","u":
            vowels += 1
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            consonants += 1
        default:
            others += 1
        }
    }
    return (vowels,  consonants, others)
}
let total = count(string:"some arbitrary string! ")
print("vowels : \(total.vowels)   \(total.consonants)   \(total.others)")

// 입출력 파라메터
// inout 키워드로 정의, 함수 안에서 변경되고 함수에서 나와서 원래의 값을 대체함

func swapTwoInts( a: inout Int,  b: inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(a: &someInt, b: &anotherInt)
//-> 변수의 주소값을 넘겨줌 결국 inout은 포인터인 셈!
someInt
anotherInt


func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

var mathFunction : (Int, Int) -> Int = addTwoInts
// mathFunction 과 addTwoInts 함수의 타입(파라미터타입, 반환 타입)이 같기에 변수 할당이 가능
print("\(mathFunction(1,3))")


// 파라미터 타입으로서의 함수 타입
// (Int, Int) -> Int 와 같은 함수 타입을 파리메터타입으로 함수에 이용할 수 있다
// 이로서 함수 구현의 일부를 함수가 호출 될때 함수를 호출하는 쪽에 맡기는 것이 가능
func printMathResult(mathFunction:(Int, Int) -> Int, a: Int, b: Int){
    print("Result : \(mathFunction(a, b))")
}
printMathResult(mathFunction: addTwoInts, a:3, b:5)


// 함수 타입과 반환 타입
// 함수 타입을 다른 함수의 반환 타입을 사용할 수 있다
func stepForward(input: Int) -> Int{
    return input + 1
}
func stepBackward(input: Int) -> Int{
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int{
    return backwards ? stepBackward : stepForward
}

var currentVal = 3
let moveNearerToZero = chooseStepFunction(backwards: currentVal > 0)
print("count to zero")
while currentVal != 0 {
    print("...\(currentVal)")
    currentVal = moveNearerToZero(currentVal)
}
print(currentVal)

// 중첩된 함수들
