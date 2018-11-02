/*
 초기화
 
 초기화는 클래스, 구조체. 열거형의 인스턴스를 사용하기 위한 준비과정
 인스턴스의 각각의 저장된 속성의 초기값을 설정하는 것과 그 외의 다른 설정 또는 새 인스턴스를 사용하기 전에 필요한 초기화를 함
 스위프트의 이니셜라이저는 값을 반환하지 않음
 -> 초기 값일 자못된 곳 없이 초기화가 되었는지 보장하는 것
 
 또한 디이니셜라이저를 정의할 수 있음
 할당 해제가되기 바로직전에 맞춤 정리를 수행
 
 
 */

struct Fahrenheit{
    var temperature: Double
    init(){  // initializer 기본 속성 값을 초기화 시킴
        temperature = 32.0
    }
}

// 초기화 파라미터
struct Celsius {
    
    var temperatureInCelsius : Double = 0.0
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(formKelvin kelvin: Double){
        temperatureInCelsius = kelvin - 273.15
    }
    // 여러개의 initializer 가 가능하다
}


// 옵셔널 속성 타입
// 저장 속성이 논리적으로 '값 없음'을 갖는게 허용되면, 옵셔널 타입 속성은 자도엊ㄱ으로 il값으로 초기화됨
class SurveyQuestion{
    var text: String
    var response: String?
    init(text: String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

// 초기화 과정 중 상수 속성을 변경하기
class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String){ // text 속성이 상수라 할지라도 클래스의 이니셜라이저 안에서는 변경 될 수 있다
        self.text = text
    }
    func ask(){
        print(text)
    }
}

// 기본 이니셜라이저
// 기본 값을 모든 속성에 지정했지만 이니셜라이저를 가지지 안흔ㅇ 구조체나 베이스 클래스에 대해 기본 이니셜라이저를 제공
class ShoppingListItem{
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()


/*
 값 타입의 이니셜라이저 대리 수행 Delegation
 이니셜라이져는 인스턴스 초기화 수해으이 일부로 다른 이니셜라이저를 호출 할 수 있다 이것을 이니셜라이저 델리게이션 이라하며 중복 코드를 피할 수 있다
 구조체, 열거형과 같은 값타입은 상속을 지원하지 않기에 이니셜라이저 델리게이션 과정은 간단
 클래스는 다른 클래스를 상속 받을 수 있기에 상속 받은 저장 속성들이 초기화 과정 중 올바르게 할당 되었는지 보장해야하는 추가적인 책임 있다
 */

// 구조체
struct Size{
    var width = 0.0, height = 0.0
}
struct Point{
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init (origin: Point, size: Size){
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


/*
 클래스 상속과 초기화
 클래스의 모든 저장 속성은 반드시 초기화 과정중에 초기 값을 할당받아야 한다
 스위프트는 두종류의 이니셜라이져를 제공하여 클래스 타입의 모든 저장 속성이 초기값을 갖게끔 보장함
 
 1. 지정 이니셜라이저
    - 클래스의 주 이니셜라이저, 해당 클래스에서 접하는 모든 속성을 완전히 초기화함, 적절한 부모 클래스 이니셜라이저를 호출하여 초기화 과정을 부모 클래스로 연쇄시킴
 2. 편의 이니셜라이저
    - 클래스를 지탱하는 두번째 이니셜라이저, 같은 클래스 내의 지정이니셜라이저를 호출하는 편의 이니셜라이저를 만들 수 있음
        이 편의 이니셜라이저를 통해 호출하는 지정 이니셜라이저의 몇몇 파라미터를 기본 값으로 설정할 수 있음

 이니셜라이저 연쇄
 rule1. 지정 이니셜라이저는 반드시 바로 위 부모 클래스의 지정 이니셜라이저를 호출
 rule2. 편의 이니셜라이저는 반드시 같은 클래스 내의 호출 가능한 다른 이니셜라이저를 호출
 rule3. 편의 이니셜라이저는 반드시 궁극적으로 지정 이니셜라이저를 호출하는 것으로 끝을 내야함

 
 
이 단계 초기화
 스위프트의 초기화는 두 단계의 과정을 거침,
 첫 번째 단계 : 해당 클래스가 가지는 각각의 저장 속성에 초기값을 할당 모든 저장 속성의 초기 상태가 정해지고 나면 두뻔재 단계가 시작
 두 번째 단계 : 클래스 인스턴스가 사용될 준비가 되기 전까지, 각각의 클래스가 저장 속성을 사용자 정의할 기회를 가짐
 
 이단계 초기화를 사용하는 이유는 초기화를 안전하게 하면서도, 클래스 상속 계층 상에서 각각의 클래스가 완전한 유연성을 가지게 함
 이단계 초기화는 초기화 되기전에 접근되는 것을 방지하며, 다른 이니셜라이저에 의해 의도치 않게 다른 값이 설정되는 것을 방지
 
 */

// 지정 이니셜라이저와 편의 이니셜라이저
class Food {
    var name: String
    // 지정 이니셜라이져
    init(name: String){
        self.name = name
        
    }
    // 편의 이니셜라이져
    convenience init(){
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food{
    var quantity: Int
    init(name: String, quantity: Int){
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String){  // 편의 이니셜라이즈도 오버라이드해야댐??
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name:"Eggs", quantity: 6)

print(oneBacon.quantity)

class ShoppingListItem2: RecipeIngredient{
    var purchased = false
    var description: String{
        var output = "\(quantity) x \(name.lowercased())"
        output += purchased ? " v" : " x"
        return output
    }
}

var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name:"Bacon"),
    ShoppingListItem2(name: "Eggs", quantity:6),
    
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}



/*
 클로저나 함수로 기본 속성 값을 설정하기
 
 만약 저장 속성의 기본 값이 약간의 사용자 정의나 설정을 요구한다면, 클로저나 전역 함수를 이용하여 사용자 정의된 기본 값을 속성에 제공할 수 있다
 해당 속성이 속해있는 새 인스턴스가 초기화 될때마다, 해당 클로저나 함수가 호출됨, 그 반환 값이 속성의 기본 값으로 사용됨
 
 */
// 클로저를 이용한 초기화
struct Checkerboard{
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
        }
        return temporaryBoard
    }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool{
        return boardColors[(row * 10) + column]
    }
}
