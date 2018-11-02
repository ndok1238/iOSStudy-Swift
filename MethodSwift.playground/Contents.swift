/*
 Methods
 
 메서드는 타입에 의존적인 함수!
 
 Instance Methods
 특정 클래스 혹은 이너멀레이션의 인스턴스에 속하는 함수!
 인스턴스 속성에 접근하고 수정하는 방법이나, 인스턴스의 용도에 관련된 기능을 지원
 */

class Counter{
    var count = 0
    func increment(){
        count += 1
    }
    func incrementBy(amount: Int){
        count += amount
    }
    func reset(){
        count = 0
    }
}

class Counter2{
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int){
        count += amount * numberOfTimes
    }
}

// 모든 인스턴스 타입은 인스턴스 자체와 명확하게 동일한, 셀프라고 불리는 명시적 프로퍼티를 가지고 있음
struct Point{
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool{
        return self.x > x
        // self 가 없다면 x는 매개변수를 가리키는 것이 됨
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(x: 1.0) {
    print("bigger")
}

// 인스턴스 메소드 안에서의 값타입 변경
struct Point2{
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
    
    // 일반적으로 값타입의 프로퍼티는 인스턴스 메소드 안에서 변경될 수 없다.
//    func nonMutatingMoveByX(deltaX: Double, y deltaY: Double){
//        self.x += deltaX
//        self.y += deltaY
//    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveByX(deltaX: 2.0, y: 1.0)
//somePoint2.nonMutatingMoveByX(deltaX: 2.0, y: 1.0)
print("the point is now at \(somePoint2.x)  \(somePoint2.y)")


// 클래스의 프로퍼티는 변경이 가능함
class Point3{
    var x = 0.0, y = 0.0
    func moveByX(deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}
var somePoint3 = Point3()
somePoint3.moveByX(deltaX: 2.0, y: 1.0)
print("the point is now at \(somePoint3.x)  \(somePoint3.y)")


// self 프로퍼티에 완전한 새 인스턴스를 할당할 수도 있다
struct Point4{
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, deltaY:Double){
        self = Point4(x: (x+deltaY), y: (y+deltaY))
    }
}
enum TriStateSwitch{
    case Off, Low, High
    mutating func next(){
        switch self{
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}


/*
 타입 메소드
 인스턴스 메소드는 특정타입의 인스턴스에서 호출되는 메소드이다!
 타입자체에서 호출하는 메소드 또한 정의 할 수 있다
 클래스를 위한 타입 메소드는 func 키워드 옆에 class 키워드를 사용
 구조체와 열거형을 위한 타입 메소드는 func 키워드 앞에 static 키워드를 써서 지칭 할수 있음
 */

struct LevelTracker{
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int){
        if level > highestUnlockedLevel {highestUnlockedLevel = level}
    }
    static func levelIsUnlocked(level: Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool{
        if LevelTracker.levelIsUnlocked(level:level){
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}

class Player{
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level:Int){
        LevelTracker.unlockLevel(level: level + 1)
        tracker.advanceToLevel(level: level + 1)
        
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "cha")
player.completedLevel(level: 1)
print("\(LevelTracker.highestUnlockedLevel)")
