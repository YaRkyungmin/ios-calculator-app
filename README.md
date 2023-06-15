# 🧮📱⌨️ Calculator

## 🍀 소개
`kyungmin`이 만든 Calculator입니다. 

<br>

## 📖 목차
1. [팀원](#-팀원)
2. [Ground Rule](#-Ground-Rule)
3. [일일 스크럼](#-일일-스크럼)
4. [타임라인](#-타임라인)
5. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

## 👨‍💻 팀원
| kyungmin |
| :------: |
|<Img src="https://cdn.discordapp.com/attachments/1100965172086046891/1108927085713563708/admin.jpeg" width="200"> |
|[Github Profile](https://github.com/YaRkyungmin)

</br>

## 🤙 Ground Rule
- [Ground Rule](https://github.com/YaRkyungmin/ios-calculator-app/wiki/🤙Ground-Rules)

</br>

## 📝 일일 스크럼
- [일일 스크럼](https://github.com/YaRkyungmin/ios-calculator-app/wiki/🌻일일-스크럼)

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.05.29.(월)| - 유닛테스트 공부 <br> - MVC패턴 파일트리 정리 |
|2023.05.30.(화)| - TDD 공부 <br> - CalculatorItemQueue UML 작성 <br>|
|2023.05.31.(수)| - LinkedList 정리 및 구현 <br> - LinkedList 테스트 <br>| 
|2023.06.01.(목)| - CalculatorItemQueue 기능 구현 <br> - Generic Method 공부 <br> - associatedType공부(Protocol) <br>|
|2023.06.02.(금)| - 피드백 요청사항 반영 <br> - 테스트 객체를 이용한 테스트 <br> - 리드미 작성| 
|2023.06.05.(월)| - llvm공부 <br> -lldb공부 <br> -피드백 답변|
|2023.06.06.(화)| - split, component, while let, CharacterSet, contentsOf 공부<br> - forEach, map 고차함수 공부|
|2023.06.07.(수)| - 후행클로저, 탈출클로저 공부, Decimal 타입 공부 <br> - autoLayout공부|
|2023.06.08.(목)| - filter, reduce, compactMap, flatMap 공부 <br>- 피드백 요청사항 반영 <br> - 피드백 답변 <br>- git stash 공부|
|2023.06.09.(금)| - View, ViewController 사이 로직 구현 <br> - UIStackView공부 <br> - self, Self 차이 공부 <br> - 주간 리드미 수정|

## 👀 시각화된 프로젝트 구조

### Class Diagram
<p>
<img width="" src="https://github.com/YaRkyungmin/ios-calculator-app/assets/74167204/f830e72c-27f1-4594-8da0-d2e0d022ea9f">
</p>
<br>

### LinkedList 시각화
<p>
<img width="" src="https://github.com/YaRkyungmin/ios-calculator-app/assets/74167204/ebf998d4-c2c4-40ee-8484-ea98f7932270">
</p>
<br>

### 🗂폴더 구조
> Model : 앱 구동 로직에 필요한 모델
> View : 화면을 구성하는 뷰
> Controller : 화면의 이벤트와 전환을 컨트롤하는 컨트롤러
```
Calculator project
├── Calculator
│   ├── Model
│   │   ├── ExtenssionPrimitiveDataType
│   │   │   │── Double
│   │   │   └── String
│   │   ├── CalculatorProtocol
│   │   │   │── CalculatorItemQueueProtocol
│   │   │   └── CalculateItem
│   │   ├── CalculatorError
│   │   │   │── OperationError
│   │   ├── List
│   │   │   │── LinkedList
│   │   │   └── Node
│   │   ├── CalculatorItemQueue
│   │   ├── ExpressionParser
│   │   ├── Operator
│   │   └── Formula
│   │── Controller
│   │   ├── CalculatorViewController
│   │   ├── SceneDelegate
│   │   └── AppDelegate
│   ├── View
│   │   ├── Main
│   │   └── LaunchScreen
│   └── Resource
│       ├── Assets
│       └── Info
└── CalculatorTest
    ├── Calculator.xctestplan
    ├── MockCalculatorItemQueueTests
    │   ├── Test Double
    │   │   └── MockCalculatorItemQueue
    │   └── MockCalculatorItemQueueTests
    ├── FormulaTests
    │   └── FormulaTests
    └── ExpressionParserTests
        └── ExpressionParserTests
```
<br>

## 🧨 트러블 슈팅

### 1️⃣ **Linked List를 이용한 Queue 구현** <br>

🔒 **문제점** <br>
- 어떤 자료구조를 사용하여 큐를 구현 해야 할지에 대해 고민했습니다.

🔑 **해결방법** <br>
- `Array`를 사용하여 구현 할 시 `enqueue`를 해줄때는 시간복잡도가 `O(1)`이지만 `dequeue`를 해줄때는 제일 첫번째 요소를 빼주고 남은 요소들을 앞 당겨줘야 해서 시간 복잡도가 `O(n)`에 가깝기 때문에 이 방법은 배제시켰습니다.
- `LinkedList`방식으로 구현할 시 `enqueue`, `dequeue`해줄 때 모두 시간복잡도가 `O(1)`이기 때문에 이 방식으로 구현했습니다.
- 들어갈 요소의 타입에 대한 유연한 LinkedList를 만들기위해 제네릭타입으로 구현했습니다.
- `Array`에 비해 `LinkedList`방식은 `index`값이 없기 때문에 `index`를 통해 값에 접근 하지 못해 값을 찾는데 순회를 해야한다는 단점이 있지만 계산기 안에서 계산 할 요소들을 넣어주고 계산을 할 때는 `index`를 통한 접근이 필요없다 생각했습니다.
- 클래스로 구현된 각각의 `Node`가 `LinkedList`에서 `pop`될때 메모리에서 해제되는지 확인했고, `Node`의 갯수에 따라 동적으로 메모리가 할당되도록 구현했습니다.
- 
    ```swift
    class Node<T> {
        ...
        deinit {
            print("\"\(value)\"가 메모리에서 해제")
        }
    }
    ...
    linkedList.enqueue(3)
    linkedList.enqueue("+")
    print(linkedList.dequeue())
    print(linkedList.dequeue())
    //"3"가 메모리에서 해제
    //Optional(3)
    //"+"가 메모리에서 해제
    //Optional("+")
    ```
### 2️⃣ **테스트 방식에 대한 깊은 고민🤔** <br>

🔒 **문제점** <br>
- 요구사항에서는 `TDD방식`으로 `queue`를 구현 하라고 했지만, 테스트를 먼저하면서 코드를 완성해나가는 것이 매우 어려웠습니다.
- `LinkedList`를 구현할 때는 최소한으로 `firstNode`, `lastNode`, `isEmpty`, `enqueue()`, `dequeue()`만 있으면 된다고 생각했기 때문에 `first`, `last`가 필요없다고 생각했지만 `private` 접근 제한을 해준 `firstNode`, `lastNode`를 가져와서 테스트하기 위해서는 필요했습니다.
- 테스트를 위한 프로퍼티나 메서드가 존재해도 되는건지 궁금합니다.
- 프로토콜로 추상화하여 테스트 객체를 따로 만들어 주는 방식을 알고 나서 해보려 했으나 제네릭타입에 대해서는 어떤식으로 테스트를 해줘야 할지 감이 잡히지 않았습니다.

🔑 **해결방법** <br>
- CalculateItemQueue를 CalculateItemQueueProtocol로 추상화 했습니다.
- MockCalculateItemQueue라는 테스트 객체를 만들어 테스트 할 예정입니다.
<br>

### 3️⃣Folrmula타입의 result메서드 구현🤔 <br>

`operands`큐 프로퍼티에 `node`가 없을때 까지 빼서 계산결과를 누적해 반환 해야 한다고 생각했습니다. 고민하던 중 `while let`에 대해 알게됐고, 옵셔널 바인딩 값이 `nil`이 아닐때까지 계속해서 바인딩해줘서 계산한 결과를 계속해서 누적할 수 있게 구현 했습니다.
```swift
while let nextOperand = operands.dequeue() {
    guard let operatorsElement = operators.dequeue() else {
        throw OperationError.operatorNotEnoughError
    }

    accumulateValue = try operatorsElement.calculate(lhs: accumulateValue, rhs: nextOperand)
}
```

### 4️⃣`-`연산자에 대한 구분❗️
`view`에 구현돼있는 빼기 연산기호와 음수부호는 실제로 유니코드 상에서 다른것을 확인했습니다.
```swift
import Foundation
let character = "−" // 출력할 문자
if let unicodeScalar = character.unicodeScalars.first {
    let unicodeHex = String(format: "%X", unicodeScalar.value) // 16진수로 표현
    let unicodeDecimal = unicodeScalar.value // 10진수로 표현
    print("Unicode Hex: \(unicodeHex)") // 16진수 출력
    print("Unicode Decimal: \(unicodeDecimal)") // 10진수 출력
}
let character2 = "-"
if let unicodeScalar = character2.unicodeScalars.first {
    let unicodeHex = String(format: "%X", unicodeScalar.value) // 16진수로 표현
    let unicodeDecimal = unicodeScalar.value // 10진수로 표현
    print("Unicode Hex: \(unicodeHex)") // 16진수 출력
    print("Unicode Decimal: \(unicodeDecimal)") // 10진수 출력
}
//Unicode Hex: 2212
//Unicode Decimal: 8722
//Unicode Hex: 2D
//Unicode Decimal: 45
```
`Operator`타입의 각각의 `case`에 `rawValue`를 실제 연산 `button`의 `title`에 쓰여있는 `Character`값으로 부여해줬습니다. 

### 5️⃣0.1 + 0.2 = 0.30000000000000004⁉️
테스트를 하던 중 우연히 `0.1`과 `0.2`를 더할때 `0.3`이 아닌 오차가 있는 것을 확인했습니다. 이 이유는 `swift`에서 이진 부동소수점 방식으로 `Double` 값을 처리하는데 생기는 오차였습니다. 

#### Decimal
- 정확한 소수 연산을 위한 고정 소수점 숫자입니다.
- `Decimal`은 128비트로 구성, 소수점 이하 자릿수를 지원합니다.

#### NSDecimalNumber:
- `NSDecimal` 또는 `Decimal`을 래핑한 클래스입니다.
- `NSDecimalNumber`는 `NSNumber`의 서브클래스로, 객체 지향적인 방식으로 숫자 연산을 수행할 수 있게 해줍니다.
```swift
import Foundation

let test = Decimal(0.1) + Decimal(0.2)
let decimalNumber = NSDecimalNumber(decimal: test)
let doubleValue = decimalNumber.doubleValue
print(type(of: test)) //NSDecimal
print(type(of: doubleValue)) //Double
print(doubleValue) //0.3

```
`NSDecimalNumber`클래스에서 `Double`타입으로 변환하여 반환해주는 `doubleValue` 연산프로퍼티를 사용하기 위해 `Decimal`타입 값을 `NSDcimalNumber`에 넣어준뒤 변환해줬습니다.

## 📌 해결하지 못한 점 

### 🤔 View와 ViewController사이의 계산기 로직 구현<br>
연산이 끝났을때 다시 버튼을 눌렀을때 결과값을 가지고 다음 연산을 실행시키기 위해 다음과 같이 분기를 나눠 줬습니다. 
- operandLabel이 0일 때 / operandLabel이 0이 아닐 때
- operatorLabel이 비었을 때 / operatorLabel이 안 비었을 때
- isCompleteOperation == true / isCompleteOperation == false

그리고 버튼 별로 기능을 분리해 구현했습니다.
|버튼📲|구현🔃|
|:--:|:--:|
|숫자 버튼🔢|O|
|연산 버튼➕➖➗✖️|O|
|equal 버튼🟰|O|
|sign 버튼➕➖|X|
|AC 버튼®️|X|
|CE 버튼©️|X|
|singleZero 버튼0️⃣|X|
|doubleZero 버튼0️⃣0️⃣|X|
|dot 버튼⏺️|X|

#### ✨숫자🔢 분기
|숫자 버튼🔢 Click|operatorLabel|oerandLabel|isCompleteOperation|
|:--|:--:|--:|:--:|
|1. operandLabel 입력값으로 변경||0|false|
|1. operandLabel 입력값으로 변경|+|0|false|
|1. operandLabel 입력값 더해줌||12.34|false|
|1. operandLabel 입력값 더해줌<br>|+|12.34|false|
|1. isCompleteOperation = false<br>2. operandLabel 입력값으로 변경||0|true|
|1. isCompleteOperation = false<br>2. operandLabel 입력값으로 변경||12.34|true|
|1. isCompleteOperation = false<br>2. operandLabel 입력값으로 변경|+|0|true|
|1. operandLabel 입력값 더해줌|+|12.34|true|

#### ✨연산➕➖➗✖️ 분기
|연산 버튼➕➖➗✖️ Click|operatorLabel|oerandLabel|isCompleteOperation|
|:--|:--:|--:|:--:|
|1. ExpressionString에 operatorLabel+operandLabel 더해줌<br>2. operatorLabel 입력값으로 변경<br>3. operandLabel 초기화|+|12.34|false|
|1. ExpressionString에 operandLabel 저장<br>2. operatorLabel 입력값으로 변경<br>3. operandLable 초기화||12.34|false|
|1. operatorLabel 입력값으로 변경|+|0|false|
|1. operatorLabel 입력값으로 변경<br>||0|false|
|1. ExpressionString에 operatorLabel+operandLabel 저장<br>2. operatorLabel 입력값으로 변경<br>3. operandLabel 초기화|+|12.34|true|
|1. ExpressionString 초기화<br>2. ExpressionString에 operandLabel 저장<br>3. operatorLabel 입력값으로 변경<br>4.isCompleteOperation = false <br>5. operandLable 초기화||12.34|true|
|1. operatorLabel 입력값으로 변경|+|0|true|
|1. operatorLabel 입력값으로 변경<br>||0|true|

#### ✨equal🟰 분기
|equal 버튼🟰 Click|operatorLabel|oerandLabel|isCompleteOperation|
|:--|:--:|--:|:--:|
|1. ExpressionString에 operatorLabel+operandLabel 저장<br>2. ExpressionString의 결과값 추출<br>3. operandLabel 결과값으로 변경<br>4. operatorLabel 초기화<br>5. ExpressionString 초기화<br>6. isCompleteOperation == true|+|12.34|false|
|1. ExpressionString의 결과값 추출<br>2. operandLabel 결과값으로 변경<br>3. operatorLabel 초기화<br>4. ExpressionString 초기화<br>5. isCompleteOperation == true|+|0|false|
|return||12.34|false|
|return||0|false|
|return||12.34|true|
|return||0|true|
|return|+|12.34|true|
|return|+|0|true|

💭 분기를 따로 써주지 않고 코드를 구현했을때 한 기능이 구현 되면 다른 기능에 문제가 생기는 일이 빈번해서, 분기를 작성해줬습니다. 아직 구현이 완벽하지 않고, 옳은 접근 방식인지 의문이 들지만 분기가 많을 때 따로 작성해서 구현해주는 것이 코드구현에 도움이 되는것을 깨달았습니다.  

## 📚 참고 링크
- [📗블로그: 제네릭(Generic) 정복하기](https://babbab2.tistory.com/136)
- [🐻야곰닷넷: Unit Test 작성하기](https://yagom.net/courses/unit-test-작성하기/)
- [🍎Apple Docs: Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [🍎Apple Docs: Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols)
- [🍎Apple Docs: components](https://developer.apple.com/documentation/foundation/nsstring/1413214-components)
- [🍎Apple Docs: forEach](https://developer.apple.com/documentation/swift/array/foreach(_:))
- [🍎Apple Docs: filter](https://developer.apple.com/documentation/combine/anypublisher/filter(_:))
- [🍎Apple Docs: reduce](https://developer.apple.com/documentation/swift/array/reduce(_:_:))
- [🍎Apple Docs: compactMap](https://developer.apple.com/documentation/swift/sequence/compactmap(_:))
- [🍎Apple Docs: Decimal](https://developer.apple.com/documentation/foundation/decimal)
- [🍎Apple Docs: NSDecimalNumber](https://developer.apple.com/documentation/foundation/nsdecimalnumber)
