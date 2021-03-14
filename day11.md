# Day 11 - 프로토콜과 확장

Protocols and Extensions  
`protocols`, `extensions`,`protocol extensions`

## 목차

1. 프로토콜  
   `Protocols` 

2. 프로토콜 상속   
   `Protocol inheritance`

3. 확장(익스텐션)    
   `Extensions`

4. 프로토콜 확장  
   `Protocol extensions`

5. 프로토콜 기반 프로그래밍  
   `Protocol-oriented programming`

---

<br>

### 1. 프로토콜 `Protocols`

[장국진님 블로그](https://medium.com/@jgj455/%EC%98%A4%EB%8A%98%EC%9D%98-swift-%EC%83%81%EC%8B%9D-protocol-f18c82571dad)에서 정의를 참고했습니다.

프로토콜은 특정 역할을 하기 위한 메소드, 프로퍼티, 기타 요구사항 등의 청사진입니다.

- 프로토콜은 정의만 하고 스스로 기능을 구현하지 않습니다.
- 하나의 타입으로 사용됩니다.

```swift
다음과 같은 형태로 정의를 합니다.
protocol 프로토콜이름 {
  // 프로토콜 정의
}
```
```swift
// 구조체, 클래스, 열거형 등에서 채택을 해서 사용합니다.

// 프로퍼티에서 프로퍼티를 정의할 때는 get과 set키워드를 사용해서 
// 읽기 전용인지 읽기 쓰기 프로퍼티인지 명시해줘야 합니다.
protocol Identifiable {
    var id: String { get set } // - 읽기 쓰기
    var name: String { get } // - 읽기 전용 
}

// 채택을 할 때는 콜론을 붙여줍니다.
// 프로토콜을 따르는 구조체를 만들어 봤습니다.
struct User: Identifiable {
    var id: String
    var name: String
}

// Identifiable 프로토콜을 받아들이는 함수를 작성해보았습니다.
func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}
```



<br>

### 2. 프로토콜 상속 `Protocol inheritance`

한 프로토콜은 다른 프로토콜로 상속이 가능합니다.  
클래스와 다르게 여러 개의 프로토콜을 동시에 상속받을 수 있는데요.

```swift
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

// 위에 프로토콜 3개를 정의하고 상속받아서 단일 프로토콜로 만들어보았습니다.
// 콜론(:)과 쉼표(,)를 이용해서 상속받습니다.
protocol Employee: Payable, NeedsTraining, HasVacation { }
```

<br>

### 3. 확장 `extensions`

확장(=익스텐션)을 사용하면 기존 유형에 메소드를 추가해서 원래 설계되지 않은 작업을 할 수 있습니다.  
Int 타입에 새로운 메서드를 확장해보겠습니다. 

```swift
// 제곱해주는 메서드를 추가해보았습니다.
extension Int {
    func squared() -> Int {
        return self * self
    }
}

// 기존에 존재하지 않은 메서드를 새롭게 추가해서 사용할 수 있게 되었습니다.
let number = 8
number.squared()
```

```swift
// 익스텐션에는 저장 프로퍼티를 추가할 수 없습니다.
// 대신, 연산 프로퍼티를 사용할 수 있습니다.
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}
```

<br>

### 4. 프로토콜 확장 `Protocol extensions`

프로토콜을 사용하면 직접적으로 코드를 작성하지 못하고, 확장을 사용하면 동시에 여러 타입에 메서드를 추가할 수 없습니다.  
이러한 문제를 해결하기 위한 방법으로 프로토콜 확장이 있습니다.  
프로토콜 자체를 확장하는 거죠!  
예를 하나 보시죠.

```swift
// 요런식으로 배열과 집합이 존재합니다.
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

// 두가지의 타입은 모두 Collection이라는 프로토콜을 따릅니다.
// 우리가 두가지 모두에 메서드를 확장하고 싶다면 Collection 프로토콜을 확장하면 되겠죠?
extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

// 그러면 두가지 모두 summarize 함수를 사용할 수 있습니다.
pythons.summarize()
beatles.summarize()
```

프로토콜 기반 프로그래밍에 관련된 내용은 4번에 이어지는 내용이기 때문에 이어서 작성하겠습니다.

프로토콜은 본래 직접적으로 코드를 작성할 수 없습니다.   
그렇기 때문에 프로토콜을 채택한 쪽에서 반드시 메서드에 대한 실행 코드를 만들어줘야 합니다.  
하지만, 확장을 이용하면 자체 메서드를 가질 수 있게도 만들 수 있죠.

```swift
protocol Identifiable {
    var id: String { get set }
    func identify()
}

// 확장을 통해 메서드에 대한 내용을 작성해줄 수 있습니다.
// 마치 프로토콜도 자체적으로 메소드를 가진 것처럼 보입니다.
extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

// 채택한 곳에서 메서드 구현을 따로 안해도
// 이미 identify 메서드를 가지고 있습니다.
struct User: Identifiable {
    var id: String
}

// 다음과 같이 바로 사용할 수 있습니다.
let twostraws = User(id: "twostraws")
twostraws.identify()
```


