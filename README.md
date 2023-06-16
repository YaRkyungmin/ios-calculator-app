# 🧮📱⌨️ Calculator

## 🍀 소개
`EtialMoon`과`kyungmin`이 만든 Calculator입니다. 

## 📖 목차
1. [팀원](#-팀원)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [트러블 슈팅](#-트러블-슈팅)
5. [참고 링크](#-참고-링크)

## 👨‍💻 팀원
|EtialMoon|kyungmin|
|:-:|:-:|
|<img src="https://i.imgur.com/hSdYobS.jpg" width="200"/>|<Img src="https://cdn.discordapp.com/attachments/1100965172086046891/1108927085713563708/admin.jpeg" width="200"> |
|[Github Profile](https://github.com/hojun-jo)|[Github Profile](https://github.com/YaRkyungmin)|

## 📆 타임라인  
|**날짜**|**진행 사항**|
|:-:|-|
|2023-06-12|- CalculatorItemQueue타입 코드 병합<br>- Operator타입 코드 병합<br>- Formula타입 코드 병합<br>- ExpressionParser타입 코드 병합|
|2023-06-13|- CalculatorViewController 코드 병합|
|2023-06-14|- CalculatorViewController 코드 리팩토링<br>- UIScrollView Extension 구현|
|2023-06-15|- String Extension 구현<br> - CalculatorError 구현|
|2023-06-16|- 전체적인 리팩토링<br>- 리드미 작성|

## 👀 시각화된 프로젝트 구조
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
│   │   │   └── CalculatorError
│   │   ├── List
│   │   │   │── LinkedList
│   │   │   └── Node
│   │   ├── CalculatorItemQueue
│   │   ├── ExpressionParser
│   │   ├── Operator
│   │   └── Formula
│   │── Controller
│   │   ├── CalculatorViewController
│   │   ├── ExtensionUIScrollView
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

### 🛠 실행 화면
 |**기본 연산**|**소수 연산**|**AC, CE 버튼**|
 |:---:|:---:|:---:|
 |![](https://hackmd.io/_uploads/HJCCA5Ov3.gif)|![](https://hackmd.io/_uploads/BknMkj_v3.gif)|![](https://hackmd.io/_uploads/r1jQJodPn.gif)|
 |**0, 00입력 제어**|**0으로 나눌 시 NaN**|**부호 바꾸기**|
 |![](https://hackmd.io/_uploads/BJYqJjODh.gif)|![](https://hackmd.io/_uploads/Syyi1i_Dh.gif)|![](https://hackmd.io/_uploads/HyOoyoOPn.gif)|

### ⭐️ Class 다이어그램
<img width="" src="https://github.com/YaRkyungmin/ios-calculator-app/assets/74167204/5c56236d-af82-448d-a438-710fec13db10">
리팩토리♻️ 이후 수정 예정 

### 🔁 LinkedList 시각화
<p>
<img width="" src="https://github.com/yagom-academy/ios-calculator-app/assets/74167204/ef17ca8a-4ebf-46a0-b52e-a1a621d6e5d0"> 
 
---
## 🚀 트러블 슈팅
### ✨ CalculatorItemQueue 타입 선택
- DoubleStackQueue 🔃
배열 두 개를 활용하여 큐를 구현한 자료구조 입니다. `enqueue`할때는 시간복잡도가 `O(1)`이고 `dequeue`는 `enqueue`를 통해 값이 저장된 배열을 뒤집어, `dequeue`에 사용할 배열에 할당하는 과정에서 `O(n)`이 됩니다. 그 이후 `dequeue`에서는 `dequeue`에 사용하는 배열에서 값을 꺼내기 때문에 `O(1)` 입니다.

- LinkedList ➡️
노드의 연결을 통해 구현한 자료구조 입니다. `enqueue`해줄때는 `O(1)`이고, `dequeue`해줄때도 `O(1)`의 시간복잡도를 가집니다.


더블스택에서는 디큐 배열에 넣어줄때 순회를 한번해야한다는 단점때문에 `LinkedList` 채택 했습니다.

선택❗️: **LinkedList**


### ✨ Operator 타입 선택
- NSDecimalNumber
고정소숫점 방식인 `decimal`타입을 이용해서 최대한 오차없는 계산을 가능하게 해 줍니다.

- Numberfomatter
`maximumFractionDigits` 프로퍼티를 사용하여 소수점 15자리에서 반올림되기 때문에 그 이하의 오차에 대해 무시 됩니다.

`Numberfomatter`에서 계산된 결과에 대한 오차 처리를 해주기 때문에 `Numberfomatter`방식을 채택했습니다.

선택❗️: **Numberfomatter**

### ✨ Formula 타입 선택

- 0을 나눌때 오류를 던지는 곳 -> Formula? 🤾‍♂️
`Double`타입에 대해 `0`으로 나누기를 했을때 오류가 나지않고 `infinity` 혹은 `nan`을 반환하기 때문에 그 결과값에 대한 오류는 `Formula` 타입 안 `result` 메서드 에서 던져야 한다고 판단 했습니다.

- 0을 나눌때 오류를 던지는 곳 -> Operator? 🤾🏻
실질적인 연산을 `Operator`에서 해주기 때문에 `Operator`에서 0을 나눴을때 에러를 던져줘야 한다고 판단했습니다.

실질적인 Double타입에 대한 연산오류가 아닌 결과값을 보고 판단하여 오류를 던지기 때문에 Formula에서 오류를 던지는 방법을 채택 했습니다.

선택❗️: **Formula**

### ✨ ExpressionParser 타입 선택

- extension String(components)
`split`을 이용해서 분리해주면 `subString`타입으로 반환해주기 때문에 다시 `String`타입으로 변환해줘야하는 `components`를 사용하면 그 작업을 배제할 수 있기 때문에 `components` 사용했습니다.
`import Foundation`을 사용하지 않고도 `import Swift`만 선언한 경우에도 `String` 타입은 `components(separatedBy:)` 메서드를 사용가능 합니다. `Swift` 표준 라이브러리에 `String` 타입의 확장으로 `components(separatedBy:)` 메서드가 구현되어 있기 때문입니다.

- componentsByOperators
고차함수를 활용하여 간결한 코드를 작성하기 위해 `reduce`를 활용했습니다.

- parse
고차함수를 활용하여 간결한 코드를 작성하기 위해 `compactMap`을 활용했습니다.

선택❗️: **ExpressionParser**

### ♻️ Refactoring - CalculatorViewController

#### 📣String Extension
- 0인지 판단해주는 isZero 프로퍼티
```swift
var isZero: Bool {
    return self == "0"
} 
```
- 소수인지 판단해주는 isPrime 프로퍼티
```swift
var isPrime: Bool {
    return self.contains(".")
}
```
- 부호를 바꿔주는 convertSign 프로퍼티
```swift
var convertSign: String {
    if self.hasPrefix("-") {
        return String(self.dropFirst())
    } else {
        return "-\(self)"
    }
}
```
- 숫자뒤에 쓸모없는 소수점을 없애주는 removeTrailingDot 프로퍼티
```swift
var removeTrailingDot: String {
    if self.hasSuffix(".") {
        return String(self.dropLast())
    } else {
        return self
    }
}
```

#### 📣옵셔널 바인딩
- 옵셔널 바인딩을 해주는 unwrap 메서드
```swift
private func unwrap(_ text: String?) -> String {
    guard let text else {
        return ""
    }

    return text
}
```

#### 📣중첩 if문
- 중첩 if문 제거 및 가능한 경우 guard문으로 변경
```swift
// 수정 전
@IBAction func tapNumpad(_ sender: UIButton) {
    let labelText = unwrap(sender.titleLabel?.text)
    let inputNumberLabelText = unwrap(inputNumberLabel.text)

    if operationReady {
        if inputNumberLabelText.isZero {
            inputNumberLabel.text? = labelText
        } else if inputNumberLabelText.count < 20 {
            let newLabelText = inputNumberLabelText + labelText
            inputNumberLabel.text? = makeNumberFormat(for: newLabelText.replacingOccurrences(of: ",", with: ""))
        }
    }
}
```
```swift
// 수정 후
@IBAction func tapNumpad(_ sender: UIButton) {
    guard operationReady else {
        return
    }
    
    let labelText = unwrap(sender.titleLabel?.text)
    let inputNumberLabelText = unwrap(inputNumberLabel.text)

    if inputNumberLabelText.isZero {
        inputNumberLabel.text? = labelText
    } else if inputNumberLabelText.count < 20 {
        let newLabelText = inputNumberLabelText + labelText
        inputNumberLabel.text? = makeNumberFormat(for: newLabelText.replacingOccurrences(of: ",", with: ""))
    }
}
```

#### 📣errorDescription
- catch문에서 에러에 대한 내용을 errorDescription을 사용하여 출력
```swift
enum OperationError: Error, LocalizedError {
    case divideByZeroError
    case operandNotEnoughError
    case operatorNotEnoughError
    
    var errorDescription: String {
        switch self {
        case .operandNotEnoughError:
            return "Operand Not Enough Error"
        case .operatorNotEnoughError:
            return "Operator Not Enough Error"
        case .divideByZeroError:
            return "divide by zero"
        }
    }
}
```

---
## 📚 참고 링크
- [🍎Apple Docs: components](https://developer.apple.com/documentation/foundation/nsstring/1413214-components)
- [🍎Apple Docs: reduce](https://developer.apple.com/documentation/swift/array/reduce(_:_:))
- [🍎Apple Docs: compactMap](https://developer.apple.com/documentation/swift/sequence/compactmap(_:))
