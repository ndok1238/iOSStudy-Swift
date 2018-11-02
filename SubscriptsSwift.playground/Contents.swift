/*
 Subscripts
 
 클래스, 구조체, 열거형은 collection, list, sequence의 멤버 요소에 접근하기 위해 축약형인 서브스크립트로 정의할 수 있다
 또한 값의 설정이나 검색을 위한 별도의 메서드 없이. index를 통해서 값을 설정하거나 검색하기 위해 서브스크립트를 사용
 
 
 서브스크립트 문법
 문법의 인스턴스의 메서드나 계산 속성의 문법과 유사
 subscript 키워드와함께 특정한 하나이상의 입력 파라미터와 리턴타입을 통해서 정의
 */
struct TimesTable{
    let multiplier: Int
    subscript(index: Int) -> Int{
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("\(threeTimesTable[6])")

/*
 서브스크립트 사용
 특별한 클래스나 구조체의 기능을 위해 적절한 방식으로 자유롭게 대부분의 서브스크립트를 구현할 수 있다
 */

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows*columns)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < column
    }
    subscript(row: Int, column: Int) -> Double{
        get {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row: row, column: column), "Index Out of range")
            grid[(row * columns) + column] = newValue
        }
    }

}

