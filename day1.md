# Day 1 - 스위프트 기초

## 주제

`Variables` · `변수`  
`Strings and integers` · `문자열과 정수`  
`Multi-line strings` · `문자열 여러줄`  
`Doubles and Booleans` · `더블과 부울`  
`String interpolation` · `문자열 보간`  
`Constants` · `상수`  
`Type annotations`· `타입 어노테이션(주석)`

<br>

### 01. Variables vs Constants

변수와 상수 (`var` / `let`)

▶︎ 변수(var): 변하는 값을 담는 공간  
▶︎ 상수(let): 변하지 않는 값을 담는 공간

```markdown
✓ var를 사용해서 변수를 생성하고 난 다음에는 원하는만큼 자주 값을 변경할 수 있습니다. 그와 반대로 let을 사용해서 변수를 생성하면 그 값을 변경할 수 없습니다.

✓ 실제로 변수를 만든 다음에 값을 변경하지 않는 경우에는 상수를 사용하는 것이 좋습니다. 값이 변경되거나 삭제되는 혹시 모를 문제들을 방지할 수 있습니다.
```

<br>

### 02. Multi-line strings

- 문자열 여러줄을 작성하기 위해서는 큰따옴표 3쌍을 이용합니다. (three sets of double quotes)
- 중요한 포인트는 각 큰따옴표는 그 자체로 라인에 위치해야합니다. (`잘못된 예` → """One ~)

```swift
let str = """
One
Two
Three
"""
```

▶︎ 다음과 같이 선언하면 str = "One\nTwo\nThree"  
▶︎ 개행문자가 포함되어 나옵니다.

```swift
let str = """
One \
Two \
Three
"""
```

▶︎ 개행문자가 나오지 않도록 하려면 백슬래시(\\)를 각 라인에 적어줍시다.

<br>

### 03. Integers · Doubles · Booleans

정수 · 실수(소수 보유) · 부울값(true/false)

```swift
var myInt = 1       //Int
var myDouble = 1.0  //double
var isBool = true   //Bool

// 아래의 연산이 가능할까요?
var total = myInt + myDouble
```

▶︎ double에 int를 추가하는 것이 안전하다고 확신할 수 없기 때문에 서로 연산을 하는 것은 불가능합니다.  
▶︎ 간단하게 말해서 서로 연산 못합니다!

<br>

### 04. String interpolation

문자열 보간 `생각보다 엄청 자주 보는 녀석이에요!`  
쉽게 말해서, 문자열 내부에 변수를 배치하는 방법입니다.

```swift
var score = 85
var str = "Your score was \(score)"
```

▶︎ 다음과 같이 변수를 선언하고 백슬래시와 괄호를 이용하면 문자열 내부에 변수를 배치할 수 있습니다.

그렇다면 문자열 보간이 왜 있는 것일까요?

```
우리는 정적인 문자열만 사용하지 않죠?

우리는 사용자가 사용하고 있는 관련 데이터
즉 동적인(변하는) 값을 보여주고 싶습니다.

그렇기 때문에 Swift는 런타임에 사용자 지정 데이터를
문자열에 삽입하는 방법으로 문자열 보간이라는 방법을 제공합니다.
```

### 05. Type annotation

`cf. Type Inference`  
둘 중 어느 것을 사용할지는 스타일 차이입니다.

1. Type annoation : 타입 어노테이션

   - var/let 이름: 타입 = 값
   - ex. var percentage: Double = 99

   ▶︎ 다음 3가지 이유 중 하나로 타입 어노테이션을 사용합니다.

   - 어떤 타입을 사용해야하는지 모를 때
   - 기본값과 다른 유형을 사용하기 원할 때
     - double 사용시 .0을 쓰지 않으려고
     - var percentage: Double = 99
   - 아직 값을 할당하고 싶지 않을 때
     - 🤔 경험상 이 경우 타입 어노테이션 형태로 변수를 많이 선언했던 것 같습니다.

```swift
// 다른 예시
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true
```

2. Type inference : 타입 추론

   - var/let 이름 = 값
   - ex. let str = "Hello, playground"

   ▶︎ 다음 2가지 이유 중 하나로 타입 추론을 사용합니다.

   - 코드를 짧고 쉽게 읽기 위해
   - 초기 값을 변경하여 타입을 변경할 수 있습니다.
