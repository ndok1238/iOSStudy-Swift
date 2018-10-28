/*
 
 2. 기초 다지기!1
 
 
 */


/*
 정수형 : Int
 부동 소숫점 값 :  Double, Float
 불리언 값 : Bool
 문자열 데이터 : String
 컬렉션 타입 : Array, Dictionary
 
 1)상수와 변수
 상수와 변수는 어떤 이름과 특정한 형태의 값의 결합으로 구성
 
 상수와 변수의 선언
 상수 : let 키워드
 변수 : var 키워드
*/
//ex) 로그인 횟수 추적
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0



/*
 2)타입 명시
 상수나 변수를 만들 때 어떤 형태의 값이 저장될지 명확하게 하기 위해 타입을 명시!
 */
var welcomeMessage: String = "Hello" // String 타입의 변수를 선언


/*
 3) 정수
 소수점 단위가 없는 숫자들 전체
 Swift는 8, 16, 32, 64 비트 형태로 부호 있는 정수와 부호 없는 정수를 지원
 */
// 정수의 범위 확인
let minValue = UInt8.min
let maxValue = UInt8.max

/*
 3-1) Int
 대부분의 경우 코드 내에서 사용하기 위해 특정 크기를 지정할 필요는 없다.
 32 비트 플랫폼에서 Int는 Int32 와 동일한 크기
 64 비트 플랫폼에서 Int는 Int64 와 동일한 크기
 
 3-2) UInt
 부호 없는 정수 타입! Int와 마찬가지로 현재 플랫폼에 해당하는 크기를 가짐
 
 
 4) 부동 소수점 수
 소수 부분을 갖는 숫자
 Double : 64비트 부동 소수점 수를 표현 매우 크거나 정밀한 부동 수서점 값을 원할 경우 사용
 Float : 32비트 부동 소수점 수를 표현.
 
 
 5) 타입 세이프와 타입 추정
 Swift는 타입 세이프 언어!
 항상 상수, 변수를 선언할때 타입을 명시해줘야 하는 것은 아님!
 컴파일러가 타입을 추정 하기때문에 명시하지 않아도 될때가 잇음

 
 6) 숫자의 문자표현
 10 진수는 아무런 접두어 없이
 2 진수는 0b를 붙여서
 8 진수는 0o를 붙여서
 16 진수는 0x를 붙여서
 
*/
// 17을 나타내는 다양한 표현
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

/*
 exp 지수를 가지고 있는 10진수는 기수에 10의 exp승을 곱해 얻음
 ex) 1.25e2는 1.25 * 10^2
 
 exp 지수를 가지고 있는 16진수는 기수에 2의 exp승을 곱해 얻음
 ex) 0xFp2 는 15*2^2
 */
// 12.1875를 나타내는 다양한 표현
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

// 코드의 가독성을 위해 여분의 0이나 _ 를 포함할 수 있으며 이는 실제 값에 영향을 주지 않는다.
let paddedDouble = 000123.456
let oneMillion = 1_000_00
let justOverOneMillion = 1_000_000_000.000_000_1


/*
 7) 숫자의 타입 변환
 7-1) 정수형 변환
 정수형의 타입별로 지정된 크기가 다르다. 지정된 크기의 정수형 타입에 맞지않는 숫자는 컴파일시 에러를 출력!
 */
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
//let twoThousandAndOne = twoThousand + one // twoThousand 와 one은 타입이 다르기에 연산이 불가능
let twoThousandAndOne = twoThousand + UInt16(one) // one 은 UInt8 타입이기에 UInt16 타입으로 캐스팅하여 연산을 수행

/*
 7-2) 정수와 실수 변환
 
 */
// int to double
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.141592, and is inferred to be of type Double

// double to in
let integerPi = Int(pi)
// 실수형 값을 정수형 값으로 변환시에 항상 소숫점 이하의 값을 버림한다.

/*
 8) Type Aliases
 type aliases 는 이미 존재하는 타입을 또다른 이름으로 정의하는 것을 말함
 typealias 키워드로 정의
 외부의 소스에서온 특저안 사이즈를 가진 데이터로 작업하는 경우 처럼 이미 존재하는 타입을 보다 문맥에 맞는 이름으로 알아 보고 싶을 때 유용
 -> 다른 사람이 정의한 타입의 이름을 자신의 스타일로 변경하여 코드를 짜고 싶을 때!!
 */

// UInt16 의 타입 이름을 Audiosmaple 로도 사용 가능하도록 함
typealias Audiosample = UInt16
var maxAmplitudeFound = Audiosample.min

/*
 9) 이진형
 Swift 에서 이전형 타입은 Bool !
 이진형 값은 논리저긍로 취급되며, 오직 참과 거짓의 두가지 값을 가짐 (true, false)
 */
let orangesAreOragne = true
let turnipsAreDelicious = false
// true 나 false로 값을 설정한다면 자동으로 형태가 결정되기 때문에 타입을 선언할 필요가 없다.



/*
 10) 튜플
 튜플은 여러개의 값을 하나의 값으로 묶는 것! 튜플안의 여러 값들은 어느타입도 간으하고 각각 동일할 필요도 없다.
 
 순서를 가진 타입들로부터 튜플을 만들 수 있다.
 
 튜플의 각 내용 드을 분리된 상수나 변수로 분해할 수 있고, 평상시처럼 접근도 가능
 */
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("the status code is \(statusCode)")
print("the status message is \(statusMessage)")

// 튜플의 값들 중 몇몇개만 필요하다면, 튜플을 분리할때 튜플에서 무시할 부분을 언더바로 처리!
let (justTheStatusCode, _) = http404Error

// 0 부터 시작하는 index number를 통하여 각각의 element value에 접근 가능  -> 튜플안의 구성에 대해 파악하고 있어야 사용 가능!!
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// 튜플을 정의할때 각 element들에 이름을 지어줄 수도 있음
let http200Status = (statusCode:200, description: "ok")
// 튜플에 이름을 지어줫다면 각 element에 값을 접근하기위해서 element의 이름을 사용할 수 있음
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

// 튜플은 연광성 있는 값들을 임시로 묶는데 유용하다.
// 자료구조가 임시적이지 않고 계속해서 사용될 것으로 생각된다면, 튜플보다는 클래스나 자료구조로 만드는 것이 나을 것!

/*
 11) 옵셔널
 옵셔널은 어떠한 값이 부재인지를 체크할때 사용! -> Swift에서는 변수나 상수는 nil값을 가질 수 없음 Optional 변수는 이를 가능하게 함!
 
 */
// if 문과 강제 언랩핑!
// 옵셔널이 값을 가지고 있거나 찾기위해 if 문을 사용할 수 있다.

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("\(possibleNumber) has an integer value of \(convertedNumber)")
}else {
    print("\(possibleNumber) could not be converted to an integer")
}

// 옵셔널 바인딩!
// 옵셔널이 값을 임시로 상수나 변수로 사용하도록 만들기위해 사용하는것!
// if문이나 while 문에서 옵셔널 안에 값이 있는지 체크하고 이를 상수나 변수로 추출하는 것을 한번에 하기위해 사용 할 수 있다.

if let actualNumber = convertedNumber {
    print("\(possibleNumber) has an integer value of \(convertedNumber)")
}else {
    print("\(possibleNumber) could not be converted to an integer")
}


/*
 무조건적으로 언랩핑된 옵셔널
 때때로 옵셔널은 처으믕로 값을 설정한 이후에는 값을 가지고 있따는 것은 프로그램 구조적으로 명확하다.
 이럴때는 옵셔널 값에 접근할 때마다 체크하고 언랩핑해야하는 과정을 없애는데 유용!
 타입 뒤에 물음표보다 느김표를 붙이느 ㄴ것으로 Implicitly Unwrapped Option 을 만들 수 있따.
 */
// 옵셔널 String과 무조건적인 언랩핑 옵셔널 String의 차이
let possibleString:String? = "An optional string"
print(possibleString!)
let assumedString : String! = "An implicitly unwrapped optional string."
print(assumedString)


/*
 12) Assertions
 옵셔널은 값이 있는 않은지 체크를 할 수 있게해주고, 값이 부재할 시 대처하는 코드를 작성
 
 */
// Assertions 을 통한 디버그
// assertion은 논리적 조건이 항상 true인지 런타임에 체크
// Xcode에서 앱을 빌드하고 실행할때 assertion이 발생한다면 어디서 에러가 났는지 볼 수 있고 assertion이 발생한 시점에서의 앱의 상태를 요구할 수 잇으며, 디버그 메시지도 제공

//let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")

/*
 어떠한 조건이 false가 될 수 있지만 코드 실행을 계속하기 위해서는 반드시 true 이여만 하는 곳에 assertion을 사용!
 1. 어떠한 정수의 서브스크립트 커스텀 서브스크립트 구현을 위해 제공되었으나, 그 서브스크립트 인덱스의 값이 너무 크거나 작을 수 있을때.
 2. 함수로 넘긴 어떤 값이 함수에서 작업을 진행하는데 적합하지 않은 값일때.
 3. 옵셔널 값이 현재 nil 인데 추후의 코드 실행을 위해서 nil이 아닌 값이 필요할때.
 */


