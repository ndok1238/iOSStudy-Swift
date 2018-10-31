/*
 
 5. 문자열과 문자
 
 문자열은 문자의 컬렉션!
 
 1) 문자열 리터럴
 
 문자열 리터럴에 특수문자를 포함 시킬 수 있따.
 이스케이프 특별 문자.
 \0. : null문자
 \\ : 백슬래스
 \t : 수평 탭
 \n : 줄 바꿈
 \r : 캐리지 리턴
 \" : 큰 따옴표
 \' : 작은 따옴표
 
 1바이트 유니코드 스칼라 : \xnn 이며 nn은 두개의 16진수
 2바이트 유니코드 스칼라 : \unnnn 이며 nnnn은 4개의 16진수
 4바이트 유니코드 스칼라 : \Unnnnnnnn 이며 nnnnnnnn은 8개의 16진수
 */

// 특수문자의 예
let wiseWords = "\"Imageination is more importatn than knowledge\" - Einstein"
//let dollarSign = "\x24"
//let blackHeart = "\u2665"
//let sparklingHeart = "\U0001F496"

// 안되는 듯??


// 2) 빈 문자의 초기화
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty{
    print("비어 있는 스트링")
}

// 3) 문자열 가변성
// 특정 String을 변수에 할당하여 수정 할 수 있는지를 나타내거나 상수를 말함
var variableString = "Horse"
variableString += " and carriage"
// 아래의 코드는 상수에 변동을 하려고 시대했기에 컴파일 에러!
//let constantString = "Highlander"
//constantString += " and another Highlander"

// 4) 문자열 값 타입()
// String 타입은 값 타입!!
// 새 String 값을 만드는 경우에 상수 또는 변수에 할당되면 그 문자열 값이 함수나 메소드에 전달 될 때 복사됨


for character in "Dog!"{
    print(character)
}
for char in variableString{
    print(char)
}

// 5) 문자 세기
//let unusualMenagerie = "Koala, Snail, Penguin, Dromedary"
//print("\(countElements(unusualMenagerie))")

// 6) 문자열 비교
// 두개의 String 값이 동일한 순서로 포함되어 있는 경우 두개의 문자열이 동일한 것으로 간주!
let fir = "We're a lot alike, you and I."
let sec = "We're a lot alike, you and I."
let three = "We're a lot alike, you and I"
if fir == sec{
    print("Correct")
}
if fir == three{
    print("Correct")
}else {
    print("discorrect")
}


/*
 7) Prefix and Suffix Equality
 
 문자열이 특정 문자열의 전위 또는 후위가 있는지를 확인하여 문자열의 hasPrefix 및 hasSuffix 메서드를 호출,
 String 타입의 단일 인수인 부울값을 각각 반환함
 */

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 "){
        act1SceneCount += 1
    }
}
print("\(act1SceneCount)")


/*
 유니코드
 유니코드는 국제 표준 인코딩 및 텍스트를 나타내는 것
 
 유니코드의 모든 문자는 하나 이상의 유니코드 스칼라로 표현 될 수 있다.
 유니코드 스칼라는 문자 또는 수정에 대한 고유한 21bit
 */
//UTF-8
let dogString = "Dog!"
for codeUnit in dogString.utf8 {
    print("\(codeUnit)")
}

