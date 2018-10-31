/*
 6. 컬렉션 타입
 여러 값들을 한꺼번에 저장하기 위해 배열과 딕셔너리로 알려진 컬렉션 타입을 제공
 
 배열 : 동일한 타입을 가진 값을 순서대로 저장
 딕셔너리 : 동일한 타입을 가진 값을 순서와 상관없이 저장
 
 스위프트에서 배열과 딕셔너리는 항상 자신이 저장하고자 하는 키와 값의 타입을 확인
 */

/*
 배열
 
 */
var shoppingList: [String] = ["Eggs", "Mink"]
print(shoppingList)

shoppingList.append("add")
print(shoppingList.count)
shoppingList.insert("0index", at: 0)
print(shoppingList)  // insert 를 하면 뒤로 밀림!
shoppingList.remove(at: 0)
print(shoppingList) // remove 를 하면 공백 자동으로 채워짐


// for-in 반복문을 사용하면 배열 안의 모든 값들에 접근 가능
for item in shoppingList {
    print(item)
}

// 인덱스 값이 필요하다면 enumerate 함수를 사용해 배열을 돌릴 수 있다.
for (index, value) in shoppingList.enumerated() {
    print("index : \(index)  value : \(value)")
}

// 배열의 생성과 초기화
var someInts = [Int]()
print("\(someInts.count)") // 인트 배열생성 및 초기화



/*
    딕셔너리!!
 */
var airports:Dictionary<String, String> = ["TYO":"Tokyo","DUB":"Dublin"]
// 딕셔너리 생성 및 초기화
print("dictionary value : \(airports)  count : \(airports.count)" )
airports["LHR"] = "London" // 새로운 값 추가
airports["TYO"] = "new typ vlaue" // 값 업데이트
print(airports)
// 값 업데이트 updateValue를 이용하면 이전 가지고 있던 값을 리턴 옵셔널 값!1
if let oldValue = airports.updateValue("new dub vlaue", forKey: "DUB") {
    print("the old value fo dub was \(oldValue)")
}
print(airports)
// 딕셔너리에 nil값을 넣는 것으로 키/밸류 쌍을 삭제 할 수 있다.
 airports["TYO"] = nil
print(airports)

// 딕셔너리에 반복문 사용하기
// for-in 을 사용하면 딕셔너리 각각의 아이템은 (key, value) 튜플을 반환

for (airportCOde, airportName) in airports {
    print("\(airportCOde) : \(airportName)")
}

// 빈 딕셔너리 생성
var nameOfIntegers = Dictionary<Int, String>()
nameOfIntegers[16] = "sixteen"

/*
 컬렉션의 변경 가능성
 배열과 딕셔너리는 하나의 컬렉션 안에 여러개의 값을 저장한다.
 만약 어떤 변수를 배열이나 딕셔너리 형태로 만든다면 이 컬렉션은 변경이 가능!
 -> 컬렉션이 초기화된 후에도 아이템을 추가하거나 뺀거나 하는식의 크기를 변경시킬 수 있다는 것을 의미!
 반면, 배열이나 딕셔너리를 상수에 할당하면 이때에는 컬렉션의 값도, 크기도 바꿀 수 없다.
 */


