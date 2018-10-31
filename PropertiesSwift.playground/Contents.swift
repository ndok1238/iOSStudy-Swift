/*
    Properties
 
 속성은 특정 클래스, 구조체, 혹은 열거형과 값들을 연결해준다.
 저장 속성은 상수나 변수값을 인스턴스의 일부로 저장한다.
 계산 속성은 값을 그냥 저장하는 것이 아니라 계산하여 저장한다.
 계산 속성은 클래스나 구조체 열거형에서 사용할 수 있으며 저장속성은 클래스와 구조체에서만 사용할수 있다.
 
 저장 속성
 상수, 변수(let, var)이 있다
 */

struct FixedLengthRange{
    var firstValue:Int
    let length: Int
    
    func toString() -> String{
        return "first : \(firstValue)  length : \(length)"
    }
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

// 상수 구조체 인스턴스의 저장속성
// 상수로 변수가 선언되었기 때문에 firstValue 가 var로 선언되었더라도 수정이 불가능하다
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfThrrangeOfFourItemseeItems.firstValue = 6

// Lazy Stored Property
// 초기값이 최초로 사용되기전까지는 계산되지 않는다.!
// @lazy 라고 써줌으로써 정의 가능
class DataImporter{
    /*
     dataimporter is a class to impoirt data from an external file.
     the class is assumed to take a non-trivial amount of time to initialize.
     */
    var fileName = "data.txt"
    // the dataimorter class would provide data importing functionality here
}

class DataManager{
    lazy var importer = DataImporter()
    var data = [String]()
    // the datamanager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the dataimporter instance for the importer property has not yet been created

print(manager.importer.fileName)
// the dataimporter istance for the importer property ahs now been created


/*
 계산속성
 실제로 값을 저장하지는 않고, 다른 속성이나 값들이 간접적으로 접근하여 값을 조회하거나 수정할 수 있는 getter와 setter를 제공
 */

struct Point{
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    var center : Point{
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)

// 읽기 전용 계산속성
// getter 만 있고, setter가 없는 계산소것ㅇ은 읽기전용 계산속성이라 부른다.

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double{
        return width * height * depth
    }
}

// 속성 감시자
// 속성 감시자는 속성 값변경을 감시하고 대응함
// 새값이 현재 값과 동일하다더라도 호출된다
// willSet : 값이 저장되기 직전에 호출
// didSet : 새 값이 저장된 직후에 호출

class StepCounter{
    var totalSteps: Int = 0{
        willSet{
            print("Abou to set totalStep to \(newValue)")
        }
        didSet{
            if totalSteps > oldValue{
                print("added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
