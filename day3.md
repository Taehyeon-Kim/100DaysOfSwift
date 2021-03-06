# Day 3 - 연산자와 조건

Operators and conditions

## 주제

`Arithmetic Operators` · `산술 연산자`  
`Operator overloading` · `연산자 오버로딩`  
`Compound assignment operators` · `복합 할당 연산자`  
`Comparison operators` · `비교 연산자`  
`Conditions` · `조건`  
`Combining conditions` · `조건 결합`  
`The ternary operator`· `삼항 연산자`  
`Switch statements`· `Switch 문`  
`Range operators`· `범위 연산자`

<br>

### 01. 산술 연산자

- Arithmetic Operators
- 간단하게 사칙연산 기호에 대해서 배운다고 생각하면 좋을 것 같습니다.
- 🤔 서로 다른 자료형끼리의 연산은 불가능합니다 ▶︎ Swift는 타입 간의 자동 변환을 허용하지 않습니다!

```swift
이 친구는 결과값이 어떻게 나올까요?

var result = 2 + 2 + 1.0

에러가 발생하지 않고, 5라는 결과값이 생성됩니다.

print(type(of: result))
타입을 찍어보니, "Double\n" 이라는 결과가 나오네요...?

음 애초에 5라는 값이 double형으로 저장이 되어 버리는 것 같네요.

아래에 있는 연산과는 전혀 다른 성격이랍니다.

var one: Int = 2
var two: Int = 2
var three: Double = 1.0
var other = one + two + three

Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
역시나 Int형과 Double형은 서로 연산을 할 수가 없어요!
```

<br>

**기호 설명**
| 연산자 | 설명 | 비고 |
| ------ | ------ | ---- |
| + | 덧셈 |
| - | 뺄셈 |
| \* | 곱셈 |
| / | 나눗셈 |
| % | 나머지 |

<br>

**🌱 예시 코드**

```swift
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore        // 덧셈  16
let difference = firstScore - secondScore   // 뺄셈   8
let product = firstScore * secondScore      // 곱셈  48
let divided = firstScore / secondScore      // 나눗셈 3
let remainder = 13 % secondScore            // 나머지 1
```

<br>

**🧐 추가적으로 살펴볼 코드**

```swift
// 나머지 연산자
let weeks = 465 / 7
let days = 465 % 7
print("There are \(weeks) weeks and \(days) days until the event.")

// isMutiple(of:)
// 다른 숫자로 나누어 떨어지는지 체크해주는 함수
let number = 465

// false (465가 7로 나누어 떨어지는지 → X)
let isMultiple = number.isMultiple(of: 7)
```

<br>

### 02. 연산자 오버로딩

- Operator Overloading

```markdown
이미 존재하는 연산자가 새로운 피연산자를 처리할 수 있도록 확장하는 방식입니다.
쉽게 말하자면 하나의 연산자가 또 다른 역할을 할 수가 있는 것이죠.
```

```swift
예를 들어서 + 연산자는 다양한 자료형을 합치는 데 이용될 수 있습니다.

// 1. 정수 Int
let meaningOfLife = 42                 // 42
let doubleMeaning = 42 + 42            // 84

// 2. 문자열 String
let fakers = "Fakers gonna "           // "Fakers gonna"
let action = fakers + "fake"           // "Fakers gonna fake"

// 3. 배열 Array
let firstHalf = ["John", "Paul"]      // ["John", "Paul"]
let secondHalf = ["George", "Ringo"]  // ["George", "Ringo"]
let beatles = firstHalf + secondHalf  // ["John", "Paul", "George", "Ringo"]

// 4. 참/거짓 Bool
Booleans은 덧셈 연산을 할 수 없습니다.
```

```markdown
이 외에도 단항 연산자 오버로딩(전위(Postfix) 연산자, 후위(Postfix) 연산자)
새롭게 연산자를 만드는 사용자 정의 연산자도 있지만, 이번에는 다루지 않겠습니다.
다음에 기회가 된다면 따로 정리해보도록 할게요!
```

<br>

### 03. 복합 할당 연산자

- Compound assignment operators

```markdown
다른 프로그래밍 언어를 학습한 적이 있다면, 이미 잘 알고 계실 것이라고 생각합니다.
= 연산자와 결합해서 (+, -, \*, /)연산자를 복합적으로 사용할 수가 있습니다.

아래에 코드로 같이 확인해보겠습니다.
```

```swift
var score = 95    // 95
score -= 5        // 90

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"  // "The rain in Spain falls mainly on the Spaniards"
```

```markdown
-= 연산 부분을 살펴보면
score -= 5는 score = score - 5와 같은 의미로 해석할 수 있습니다.
뺄셈연산을 수행하고 그 값을 다시 대입해준다는 의미겠죠!

이렇게 복합 할당 연산자를 이용하면
코드를 조금 더 간단하게 작성할 수 있습니다.

그렇다면,
더 적은 타이핑 → 더 적은 코드 → 더 적은 실수로 볼 수도 있을까요? 🤔
(항상 짧은 코드가 옳은 것은 아니겠지만, 이런 부분에서는 적은 타이핑이 좋을 것 같습니다.)
```

<br>

### 04. 비교 연산자

- Comparison operators
- 흔히 보는 수학 연산자이기 때문에 쉽게 이해할 수 있을 것 같습니다.

<br>

**기호 설명**

▶︎ 왼쪽을 기준으로 설명하겠습니다.

| 연산자 | 설명        | 비고   |
| ------ | ----------- | ------ |
| ==     | 같다        | a == b |
| !=     | 다르다      | a != b |
| <      | 작다        | a < b  |
| <=     | 작거나 같다 | a <= b |
| >      | 크다        | a > b  |
| >=     | 크거나 같다 | a >= b |

<br>

**추가 내용**  
문자열과 열거형(enum)에서도 비교가 가능합니다.

```swift
1. 문자열 비교
let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

// 문자열의 경우는 사전순으로 비교가 됩니다.
// 사전순이 더 빠를수록 크다(?!)라고 보면 될 것 같네요.
// 소문자가 대문자보다 앞 입니다 :)
print(firstName == secondName)  // false
print(firstName != secondName)  // true
print(firstName < secondName)   // true
print(other >= secondName)      // false

print(firstAge == secondAge)    // false
print(firstAge != secondAge)    // true
print(firstAge < secondAge)     // false
print(firstAge >= secondAge)    // true
```

```swift
2. 열거형 비교
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)           // true

// small의 case가 large보다 먼저 나오므로 true입니다.
// 열거형 비교를 언제 사용할 수 있을지는 감이 잘 안오네요...
```

<br>

### 05. 조건(문)

- Conditions

**① 조건문**

```
맞습니다 😁 맞아요!! 바로 생각하고 있는 그거!!
네, 우리가 정말 수 없이 많이 본 앞으로도 많이 볼 if문이라고 보시면 됩니다.
조건에 따라서 코드를 실행하거나 실행하지 않거나 결정해주죠.
간단하게 예시 코드만 보고 넘어가도록 하겠습니다.
```

**예시 코드**

```swift
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

이 경우는 21을 만족하므로 2번째 print()문이 실행되겠죠?
```

<br>

**② 조건 결합**  
마무리 하기 전에 조건을 여러 개 사용할 수 있는 방법에 대해 알아봅시다.  
&& 연산자와 || 연산자를 사용할 수 있는데요.  
각각 `그리고`, `또는`을 의미합니다.

해당 연산자를 사용해서 여러 조건을 나열할때는  
괄호( )를 이용해서 그 의미를 정확히 하도록 합시다!

```swift
let age1 = 12
let age2 = 21

// && (그리고) 연산자
// 모든 조건을 만족해야 참(True, 1)이 성립됩니다.
if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

// || (또는) 연산자
// 하나의 조건만 만족하면 참이 성립됩니다.
if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}
```

<br>

**③ 삼항 연산자**

- 삼항 연산자는 [조건] > [참일때 수행] : [거짓일때 수행]의 형태로 작성할 수 있습니다.
- 삼항 연산자보다 그냥 조건문을 사용하는 것이 더 나아보입니다.

```swift
let firstCard = 11
let secondCard = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

// 동일한 표현
if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}
```

<br>

### 05. Switch문

- 조건이 여러가지인 경우 우리는 switch문을 사용할수도 있습니다.
- if문보다 swift문을 사용하는 것이 더 좋은 경우는 언제일지 생각해보는 것도 좋을 것 같습니다.
- 동일한 값을 사용하는 여러 조건이있는 경우 switch대신 사용하는 것이 더 명확합니다!
- (switch문을 사용할 수 있는 경우라면 사용해주는 것이 가독성에 더 좋을 것 같네요..?)

```swift
다음과 같이 switch문은 각 case에 따라서 조건을 명시해줄수 있고,
case에 해당하는 경우에만 코드를 실행합니다.

다음 케이스에서도 실행을 계속하고 싶다면
fallthrough 키워드를 사용하면 됩니다.

switch문에서는 또한 default를 만들어
모든 경우를 포함할 수 있게 할 수 있습니다.

아래에서도 날씨가 비, 눈, 해가 아니라면
default에 해당하는 코드를 실행합니다.

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}
```

<br>

### 06. 범위 연산자

- Range Operators
- ... (끝 값 포함) : 닫힌 범위 연산자
- ..< (끝 값 미포함) : 반 열림 범위 연산자

**예시코드**

```swift
// 예시 1
let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

// You did great
```

```swift
// 예시 2 : 배열에서의 범위 연산자 활용
let names = ["Piper", "Alex", "Suzanne", "Gloria"]

print(names[1...3])
print(names[1...])

// ["Alex", "Suzanne", "Gloria"]
// ["Alex", "Suzanne", "Gloria"]
```
