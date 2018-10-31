/*
 클래스와 구조체
 
 클래스와 구조체는 프로그램으 코드블럭을 정의 할때 사용
 
 클래스의 인스턴스는 전통적으로 오브젝트로 알려져 있다. but, Swift의 클래스와 구조체는 다른 언어보다도 기능에 가깝다->...?? 겪어 봐야 이해가 될듯

 
 클래스와 구조체의 비교
 공통점:
 1. 값을 저장하기 위한 프로퍼티를 정의
 2. 기능을 제공하기 위한 메서드를 정의
 3. 서브스크립트 문법을 사용하여 그들의 값에 접근하는 것을 제공하는 서브스크립트들을 정의
 4. 초기 상태를 설정하기 위한 Initializer를 정의
 5. 기본적인 구현을 넘어 확장시키기 위한 확장이 가능
 6. 특정 종류의 표준 기능을 제공하는 거승로 프토토콜을 따를 수 있음
 
 클래스의 추가적인 기능
 1. 상속은 어느 클래스가 다른 클래스의 특성을 상속받을 수 있게함
 2. Type Casting 은 작동시에 클래스의 타입을 확인하고 변환을 가능하게 함
 3. Deinitializer 는 클래스의 인스턴스가 할당받은 자원을 환원 가능케 함
 4. Reference counting 은 하나의 클래스 인스턴스를 한번이상 참조하는 것을 가능하게 함
 
 
 정의
 class SomeClass{
    // class definition goes here
 }
 
 struct SomeStructure {
    // structure definition goes here
 }
 
 */

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
}

// 인스 턴스 생성 => 클래스와 구조체가 상이함
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 모든 구조체는 자동 생성된 멤버들의 Initializer를 가지고 있다.
let vga = Resolution(width: 640, height: 480)
print("\(vga.width)   \(vga.height)")

// 구조체는 복사된다!
// 클래스는 참조한다.!
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

// 구조체의 복사
cinema.width = 2048
print("hd width : \(hd.width)   cinema width : \(cinema.width)")

// 클래스의 참조
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("tenEighty : \(tenEighty.frameRate)  also : \(alsoTenEighty.frameRate)")

// 식별연산자
// === : 동일한
// !== : 동일하지 않은
if(tenEighty === alsoTenEighty){
    print("ten ans also is equal")
}

