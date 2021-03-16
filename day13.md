# Day 13 - 스위프트 복습(1)

Swift review, day one

변수, 컬렉션, 조건문, 반복문

## 주제

1. Variables and constants  

2. Type of Data

3. Operators

4. String interpolation

5. Arrays

6. Dictionaries

7. Conditional statements

8. Loops

9. Switch case
---

<br>

### 1. Swift의 변수(var)와 상수(let)에 대해서 설명하시오.

```swift
var와 let은 데이터를 저장하는 2가지 방법입니다. 
var는 처음 값을 할당하고 변경이 가능하지만 let은 값을 할당한 뒤에 변경이 불가능합니다.

* class와 같은 참조 객체는 let에 할당하더라도 내부의 값은 변경이 가능합니다.
```
참고: https://nadarm.tistory.com/87

<br>

### 2. Swift의 데이터 타입에 대해서 설명하시오.

```swift
데이터는 각자의 데이터 타입이 존재합니다. Swift에도 여러가지 데이터 타입이 존재합니다.
복잡한 자료형을 제외하면 String, Int, Float, Double, Bool 등이 있습니다.

- String은 문자열, Int는 정수형을 저장합니다.
- Float와 Double은 소수 형태의 숫자를 저장합니다.
(Double의 경우 더 높은 정확도를 가지기 때문에, Apple에서는 Double을 사용하길 권장합니다.)
- Bool은 참/거짓을 저장하는  테이터 타입입니다. true/false의 값을 담습니다.

변수를 만들 때 어떤 유형의 데이터를 보유하는지 알려주는 2가지 방법이 있습니다.
- 값을 직접 할당                    // ex. var age = 25
- 유형 주석(type annoation)사용     // ex. var name: String
                                // name = "Tim" 
```

<br>

### 3. Swift 연산자에 대해서 설명하시오.

```
🌱 산술 연산자
+ : 덧셈    (문자열 결합 가능)
- : 뺄셈
* : 곱셈
/ : 나눗셈
% : 나머지
= : 할당    (+=, -=, *=, /=, %=) - 결합해서 사용 가능

🌱 비교 연산자
>  : 큼
>= : 크거나 같음
<  : 작음
<= : 작거나 같음
== : 같음
!= : 같지 않음

🌱 논리 연산자
&& : 그리고
|| : 또는
```

<br>

### 4. 문자열 보간에 대해서 설명하시오.

```swift
Swift의 특별한 문법 중 하나로 문자열 안에 변수 또는 상수를 결합하는 방법입니다.

// 예시
var name = "taeeehyeon"
print("Hello, my name is \(name)")
```

<br>

### 5. Array에 대해서 설명하시오.

```swift
배열은 많은 데이터를 그룹화할 수 데이터 타입입니다.
대괄호를 사용해서 각 item들을 그룹화하고, 각 item들은 쉼표로 구분됩니다.
각 item의 순서는 0부터 시작되고, Swift는 0부터 계산을 시작합니다.
각 item을 접근하기 위해서는 인덱스를 이용해서 접근합니다.

// 예시
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
songs[0]
songs[1]
songs[2]

배열을 선언할 때, 어떤 데이터 타입을 담을지 구체적으로 명시해줄 수도 있습니다.

// 예시
var songs: [String] = ["Shake it Off", "You Belong with Me", "Back to December", 3]
var songs: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]

배열을 생성하는 방법은 여러가지 있지만, 대표적으로 아래와 같이 생성합니다.

// 예시
var songs: [String] = []
var songs = [String]()
```

<br>

### 6. Dictionary에 대해서 설명하시오.

```swift
Dictionary는 key와 value의 쌍으로 이루어진 데이터 집합입니다.
키, 콜론, 값을 차례로 작성하여 항목을 만듭니다.

// 예시
var person = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]
// 값에 접근하기 위해 다음과 같은 방법을 사용합니다.
person["middle"]
person["month"]
```

<br>

### 7. Conditional Statements(조건문) 대해서 설명하시오.

```swift
우리는 특정 조건을 만족할때만 코드를 실행시키고 싶습니다. 
다음과 같은 경우에 if ~ else if ~ else 이라고 불리는 조건문을 사용합니다.
조건이 참일때, 거짓일때의 처리를 각각 해줄 수 있습니다.

// 예시 1
var action: String
var person = "hater"

if person == "hater" {
    action = "hate"
} else if person == "player" {
    action = "play"
} else {
    action = "cruise"
}

// 예시 2 - 조건을 작성할 때 논리 연산자를 사용할 수 있습니다.
var action: String
var stayOutTooLate = true
var nothingInBrain = true

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}
```

<br>

### 8. Loop 대해서 설명하시오.

```swift
우리가 항상 고민 해야할 것 중에 하나는 아마도 반복되는 작업을 줄이는 방법이 아닐까 싶습니다. 
코드를 작성할때도 무언가를 만들어낼때도 반복되는 작업은 간단하게 처리할 수 있어야합니다.
Swift에서도 해당 문제를 해결하기 위해 반복문을 제공합니다.

반복문에는 대표적으로 for loop, while loop 가 존재합니다.

// for loop 예시
// loop는 중첩이 가능합니다.
var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ..< people.count {
    var str = "\(people[i]) gonna"

    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }

    print(str)
}

// while loop 예시
var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break
    }
}

반복되는 구조안에서 멈추고 싶으면 break, 계속 진행하고 싶으면 continue 키워드를 사용합니다.
```

<br>

### 9. Switch/case에 대해서 설명하시오.

```swift
switch ~ case 문은 조건문의 또 하나의 형태입니다.
특정한 변수가 주어졌을 때, 해당 변수(조건)에 해당하는 case를 실행할 수 있도록 도와줍니다.
동일한 값을 사용하는 여러 조건이 있다면 switch문을 사용하기 좋을 것 같습니다.

// 예시
let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star")

case 4...5:
    print("You're world famous!")

default:
    print("Have you done something new?")
}
```
