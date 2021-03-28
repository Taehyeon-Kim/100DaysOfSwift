# Day 8 - 구조체(1)

Structs, part one  
`structs`, `properties`, `methods`

## 목차

1. 구조체 생성 방법  
   `Creating your own structs`

2. 연산 프로퍼티  
   `Computed properties`

3. 프로퍼티 옵저버  
   `Property observers`

4. 메서드  
   `Methods`

5. Mutating 메서드  
   `Mutating methods`

6. 문자열의 프로퍼티와 메서드  
   `Properties and methods of strings`

7. 배열의 프로퍼티와 메서드  
   `Properties and methods of arrays`

---

<br>

🌱 오늘은 구조체에 대해서 배워보았습니다.  
구조체의 구성 요소에는 프로퍼티와 메서드가 있는데 그것까지 정리해보겠습니다.

<br>

### 1. 구조체 생성 방법

```
구조체와 클래스를 묶어서 생각해보겠습니다.
구조체와 클래스는 프로그래머가 데이터를 용도에 맞게 묶어 표현하려고 할 때 유용합니다.
간단하게 생각해서 새로운 데이터 타입을 만드는 것인데요.
새롭게 사용자 정의 데이터 타입을 만드려고 할 때 사용됩니다.
```

그리고 중요한 내용이 바로 아래에 있는 내용입니다.

> 🚨 struct는 값타입(Value Type)입니다.  
> 값 타입의 프로퍼티는 해당 인스턴스 메소드 내에서 수정할 수 없습니다.

<br>

더 자세한 설명은 생략하도록 하겠습니다.  
추가적인 내용은 검색해보시면 좋을 것 같아요

자, 이제 구조체를 어떻게 만드는 지 알아보도록 합시다.  
구조체는 `struct` 키워드를 이용해서 만들 수 있습니다.  
그리고, 구조체 내부에 정의된 변수를 `프로퍼티`라고 부릅니다.

```swift
// 구조체를 다음과 같이 정의할 수 있습니다.
struct Sport {
  // 구조체 내부에 정의된 변수를 프로퍼티라고 부릅니다.
  var name: String
}

// 정의한 구조체를 가지고 새로운 인스턴스를 만들 수 있습니다.
// 여기서는 tennis라는 인스턴스를 만들어 보았습니다.
var tennis = Sport(name: "Tennis")

// 구조체 안에 정의된 변수에 접근할 수 있습니다.
print(tennis.name)  // Tennis

// 일반 변수처럼 값을 변경할 수 있습니다.
tennis.name = "Lawn tennis"
```

간단하게, 구조체를 만드는 방법에 대해서 알아보았습니다!  
아! 구조체의 이름은 대문자로 작성하도록 합시다 :)

<br>

### 2. 연산 프로퍼티 (Computed properties)

```
연산 프로퍼티는 쉽게 생각해보면 다른 프로퍼티에 의존하는 녀석입니다.
다른 말로, 다른 프로퍼티에 의해서 계산되어 지는 친구죠!
코드로 보는게 더 쉬울 것 같습니다.
```

```swift
struct Sport {
    // stored property (저장 프로퍼티)
    var name: String
    var isOlympicSport: Bool

    // computed property (연산 프로퍼티)
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
```

```
위의 코드에서 olympicStatus라고 정의된 프로퍼티는
다른 프로퍼티(isOlympicSport)에 따라 값이 바뀌죠!
이 프로퍼티를 다른 프로퍼티에 의해 계산되어 진다고 해서
연산 프로퍼티라고 부릅니다.
```

```swift
let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)

// 따로 값을 부여하지 않았지만 다른 프로퍼티에 의해 값이 정해집니다.
print(chessBoxing.olympicStatus)

// 출력 결과
// chessBoxing is not an Olympic sport
```

어떻게 이해가 조금 되셨나요?  
혹시나 저장 프로퍼티 (stored property)와 연산 프로퍼티 (computed property)에 대해 궁금하신 분들은 더 찾아보시면 좋을 것 같습니다!

<br>

### 3. 프로퍼티 옵저버 (Property observers)

```
프로퍼티 옵저버를 이용하면 프로퍼티가 변경되는 전후에 코드를 실행할 수 있습니다.
예를 같이 살펴보겠습니다.
```

```swift
struct Progress {
  var task: String
  var amount: Int
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
```

```swift
progress.amount = 30
progress.amount = 80
progress.amount = 100

다음 부분처럼 계속해서 변경되는 부분이 있고,
우리가 원하는 것이 amount의 값이 변경 될 때마다 메시지를 출력하는 것일 때
프로퍼티 옵저버를 사용할 수 있습니다.
```

```swift
struct Progress {
    var task: String

    // 프로퍼티를 선언하고 didSet부분을 추가해준다.
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

// 값이 변경 될 때마다 코드가 실행됩니다.
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30    // Loading datad is now 30% complete
progress.amount = 80    // Loading datad is now 80% complete
progress.amount = 100   // Loading datad is now 100% complete
```

💁🏻 프로퍼티 옵저버로써 `didSet{}` or `willSet{}`을 이용할 수 있습니다.

- willSet: 값이 저장되기 **직전에 호출**됩니다.
- didSet: 새로운 값이 저장된 **직후에 호출**됩니다.

<br>

### 4. 메서드 (methods)

구조체 내부의 함수를 메서드라고 부릅니다.  
일반 함수 정의와 동일하게 `func`키워드를 사용해서 정의합니다.

```swift
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

// 호출은 아래와 같이 합니다.
let london = City(population: 9_000_000)
london.collectTaxes()
```

<br>

### 5. Mutating 메서드 (Mutating methods)

아까 위에서 구조체는 값 타입이라서 구조체 내부의 메소드가 프로퍼티를 수정할 수 없다고 했었죠?!

구조체의 메서드가 구조체 내부에서 데이터를 수정 할때는 `Mutating` 키워드를 이용할 수 있습니다.

```swift
// 요렇게 선언할 수 있습니다.
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
```

좀 더 이해하기 쉬운 예제가 있어 [Zedd님의 블로그에](https://zeddios.tistory.com/258)서 코드를 가져왔습니다.

```swift
struct Point {
    var x = 0.0, y = 0.0

    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)

출처: https://zeddios.tistory.com/258 [ZeddiOS]
```

<br>

### 6. 문자열의 프로퍼티와 메서드 (Properties and methods of strings)

자! 문자열 (String)도 하나의 구조체입니다.  
우리는 문자열의 다양한 프로퍼티와 메서드를 이용할 수가 있어요.

아래에서 몇 가지 예시를 같이 살펴봅시다.

```swift
let string = "Do or do not, there is no try."

// 문자열 길이 프로퍼티
// count
print(string.count)

// 찾고자 하는 단어가 있는지 확인하는 메서드
// hasPrefix()
print(string.hasPrefix("Do"))

// 대문자 변경 메서드
// uppercased()
print(string.uppercased())

// 정렬 메서드
// sorted()
print(string.sorted())

// 출력 결과
// 30
// true
// DO OR DO NOT, THERE IS NO TRY.
// [" ", " ", " ", " ", " ", " ", " ", ",", ".", "D", "d", "e", "e", "h", "i", "n", "n", "o", "o", "o", "o", "o", "r", "r", "r", "s", "t", "t", "t", "y"]
```

<br>

### 7. 배열의 프로퍼티와 메서드 (Properties and methods of arrays)

배열도 하나의 구조체인데요!  
배열의 프로퍼티와 메서드도 같이 살펴볼까요?

```swift
var toys = ["Woody"]

// count 프로퍼티
// 배열의 원소 카운트
print(toys.count)

// append() 메서드
// 배열에 원소 추가
toys.append("Buzz")

// firstIndex(of:) 메서드
// 배열의 앞에서부터 조회해서 첫번째 일치하는 값의 index를 반환
// cf) lastIndex(of:)
toys.firstIndex(of: "Buzz")

// sorted() 메서드
// 원소를 알파벳순으로 정렬
print(toys.sorted())
```
