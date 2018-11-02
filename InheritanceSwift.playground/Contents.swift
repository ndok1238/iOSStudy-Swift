/*
 상속 Inheritance
 
 하나의 클래스는 또 다른 클래스의 메서드, 프로퍼티, 이외에 다른 특징들을 상속받을 수 있다
 상속 받는 클래스를 하위클래스라 하고 상속하는 클래스를 상위클래스라 한다.
 
 모든 클래스의 상위클래스에 속한 메서드 ,프로퍼티, 서브스크립트들을 호출하고 접근할 수 있고, 해당 메서드 ,프로퍼티, 서브스크립트들을 오버라이딩하여 자신의 행동을 재정의하거나 수정할수 있다
 
 
 베이스 클래스정의
 베이스 클래스란 어떤 클래스도 상속받지 않은 클래스
 */
class Vehicle {
    var numberOfWhells: Int
    var maxPassengers: Int
    func description() -> String {
        return "\(numberOfWhells) wheels; up to \(maxPassengers) passengers"
    }
    init(){
        numberOfWhells = 0
        maxPassengers = 1
    }
}
//하위 클래스 정의

class Bicycle: Vehicle{
    override init(){
        super.init()
        numberOfWhells = 2
    }
}

let bicycle = Bicycle()
print("\(bicycle.description())")

// 하위의 또 다른 하위클래스를 만들 수 있다
class Tandem: Bicycle{
    override init() {
        super.init()
        maxPassengers = 2
    }
}

/*
 오버라이딩
 하위 클래스는 인스턴스 메서드, 클래스 메서드, 인스턴스 프로퍼티 혹은 서브스크립트에 대해 자신만의 커스텀 구현체를 제공할 수 있다
 상속한 특징을 오버라이드하려면 오버라이딩한다는 의미로 override 키워드를 접두사로 붙임
 
 상위 클래스의 메서드, 프로퍼티, 서브스크립트에 접근하는 법
 super  접두사를 가지고 접근 가능
 ex)
    someMethod() 가 오버라이드 됫을때, 오버라이딩 메서드 내부에서 super.someMethod() 르 ㄹ통해 상위클래스의 someMethod() 를 호출 가능
    someProperty 가 오버라이드 되었을때, 오버라이딩한 접근자와 설정자 내부에서 super.someProperty를 통해 상위클래스의 someProperty를 호출할 수 있다
    someIndex에 해당하는 서브스크립트가 오버라이드 되었을때, 오버라이딩한 서브스크립트 내부에서 super[someIndex]를 통해 상위클래스의 동일한 서브스크립트를 호출 할 수 있다
 
 메서드 오버라이딩
 */
class Car: Vehicle{
    var speed: Double = 0.0
    override init(){
        super.init()
        maxPassengers = 5
        numberOfWhells = 4
    }
    
    override func description() -> String {
        return super.description() + "; " + "traveling at \(speed) mph"
    }
}

let car = Car()
print("\(car.description())")

/*
 프로퍼티 오버라이딩
 프로퍼티에 대한 커스텀 접근자와 설정자를 제공하거나 프로퍼티 값의 변경을 감시하기위한 프로퍼티 관찰자를 추가하려면, 상속한 인스턴스나 클래스 메서드를 오버라이드하면 됨
 */

class SpeedLimitedCar: Car{
    override var speed: Double{
        get {
            return super.speed
        }
        set{
            super.speed = min(newValue, 40.0)
        }
    }
}

/*
 프로퍼티 관찰자 오버라이딩
 */

class AutomaticCar : Car {
    var gear = 1
    override var speed: Double{
        didset{
            gear = Int(speed / 10.0) + 1
        }
    }
    override func description() -> String {
        return super.description() + " ub gear  \(gear)"
    }
}

/*
 오버라이드 방지
 오버라이딩하지 못하게 하려면 final 키워드를 사용하면 됨
 */
