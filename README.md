# 🧮📱⌨️ Calculator

## 🍀 소개
`kyungmin`이 만든 Calculator입니다. 

<br>

## 📖 목차
1. [팀원](#-팀원)
2. [그라운드룰](#-그라운드룰)
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

## 🤙 그라운드룰
- [그라운드룰](https://github.com/YaRkyungmin/ios-calculator-app/wiki/🤙Ground-Rules)

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

## 👀 시각화된 프로젝트 구조

### Class Diagram
<p>
<img width="" src="https://github.com/yagom-academy/ios-calculator-app/assets/74167204/84ae20db-3a77-4551-bbde-bfaa05757f91">
</p>
<br>

### LinkedList 시각화
<p>
<img width="" src="https://github.com/yagom-academy/ios-calculator-app/assets/74167204/ef17ca8a-4ebf-46a0-b52e-a1a621d6e5d0">
</p>
<br>

### 🗂폴더 구조
> Model : 앱 구동 로직에 필요한 모델
> View : 화면을 구성하는 뷰
> Controller : 화면의 이벤트와 전환을 컨트롤하는 컨트롤러
> Test Double : 테스트 객체
```
Calculator
├── Model
│   ├── List
│   │   │── LinkedList
│   │   └── Node
│   ├── CalculatorItemQueue
│   └── CalculateItem
├── View
│   ├── Main
│   ├── Assets
│   └── LaunchScreen
│── Controller
│   ├── ViewController
│   ├── SceneDelegate
│   └── AppDelegate
└── Test Double
    ├── CalculatorItemQueueProtocol
    └── MockCalculatorItemQueue
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
- `CalculateItemQueue`를 `CalculateItemQueueProtocol`로 추상화 했습니다.
- `MockCalculateItemQueue`라는 테스트 객체를 만들어 테스트 할 예정입니다.
<br>

## 📚 참고 링크
- [📗블로그: 제네릭(Generic) 정복하기](https://babbab2.tistory.com/136)
- [🐻야곰닷넷: Unit Test 작성하기](https://yagom.net/courses/unit-test-작성하기/)
- [🍎Apple Docs: Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [🍎Apple Docs: Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols)

