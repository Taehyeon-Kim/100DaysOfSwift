# Day 5 - 함수

Functions

## 주제

`Writing functions` · `함수 작성`  
`Accepting parameters` · `매개변수`  
`Returning values` · `반환값`  
`Parameter labels` · `매개변수 레이블`  
`Omitting parameter labels` · `매개변수 생략`  
`Default parameters` · `매개변수 기본값`  
`Variadic functions`· `가변 함수`
`Writing throwing functions`· `throwing 함수 작성`
`Running throwing functions`· `throwing 함수 실행`
`inout parameters`· `inout 매개변수`

<br>

## 목차

[1. 함수 작성](#1.-함수-작성)  
[2. 함수의 매개변수](#2.-함수의-매개변수)  
[3. 반환값 (return)](#3.-반환값 'return')  
[4. 오류처리, 예외처리](#4.-오류처리,-예외처리)  
[+ 레퍼런스](#레퍼런스)

<br>

## 요약

1. 함수를 사용하면 반복하지 않고도 코드를 재사용 할 수 있습니다.
2. 함수는 매개 변수를 받을 수 있습니다. 각 매개 변수의 타입을 알려주어야 합니다.
3. 함수는 값을 반환 할 수 있으며 다시 보낼 데이터의 타입을 지정하면 됩니다. 여러가지를 반환하려면 튜플을 사용해야 합니다.
4. 매개 변수에 대해 외부 및 내부적으로 다른 이름을 사용하거나 외부 이름을 완전히 생략 할 수 있습니다.
5. 매개 변수는 기본값을 가질 수 있으므로 특정 값이 공통적 일 때 코드를 적게 작성할 수 있습니다.
6. Variadic 함수는 0개 이상의 특정 매개 변수를 허용하고 Swift는 입력을 배열로 변환합니다.
7. 함수는 오류를 던질 수 있지만 try를 통해서 호출하고 catch를 통해서 에러핸들링을 해야 합니다.
8. inout 키워드를 이용하면 함수 내에서 변수의 값을 변경할 수 있습니다. 하지만 일반적으로 값을 반환하는 것이 좋습니다.

<br>

---

### 1. 함수 작성

우리는 코드의 반복을 줄이기 위해서 함수를 작성하게 됩니다.  
프로그래밍을 하면서 반복은 피해야 하는 친구죠!

`func` 키워드를 이용해서 함수를 작성할 수 있습니다.

```swift
func myFunction() {
  let msg =  """
  Hello, this is my first function!
  You can make a function using func keyword.
  """

  print(msg)
}

myFunction()
```

어떠한 경우에 함수를 사용해야 할까요?  
다음의 경우 함수를 사용할 수 있을 것 같습니다.

- 여러 곳에서 동일한 기능의 사용을 원할 때!
- 코드를 분리하고 싶을 때! (큰 기능을 여러 개의 작은 기능으로 나누는 거죠 🙂)
- 기존의 존재하는 함수에서 새로운 함수를 만들어내고 싶을 때!

<br>

### 2. 함수의 매개변수

🌱 첫번째로, 일반적인 매개변수 사용부터 알아볼게요 :)

```swift
func square(number: Int) {
  print(number * number)
}

square(number: 8) // 64
```

다음과 같이 괄호 안에 변수를 전달해주게 되는데, 이 때 변수의 **타입**도 같이 알려줘야 해요.  
함수에 값을 보내고 이를 이용해서 함수 내부의 동작을 제어할 수 있습니다.

```
🚨
한 가지 생각해 볼 것은 매개변수의 사용이 6개 이상이 넘어갈 때

- 내가 적절하게 함수를 만들었는지,
- 변수의 개수가 적절한 지,
- 함수를 좀 더 작은 단위로 분리할 수 없는지!

생각해 볼 필요가 있습니다.
```

<br>

🌱 두번째로, 매개변수 레이블에 대해서 한 번 알아보죠!

```swift
func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")
```

```
우리는 매개 변수에 대해서 이름을 2가지 사용할 수 있습니다.
외부적으로는 첫 번째 이름이 사용되고,
내부적으로는 두 번째 이름이 사용됩니다.

함수의 의미를 좀 더 직관적으로 알 수 있도록 도와줍니다 :)
또한, 함수를 자연스럽게 읽을 수 있죠.

sayHello to Taylor 이렇게
Taylor에게 인사해라라는 의미로 받아들일 수 있겠네요!
```

<br>

🌱 세번째로, 매개변수 레이블을 생략할 수가 있어요!  
밑줄(\_)을 이용하면 함수를 호출할 때 레이블을 생략할 수 있습니다.

```swift
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")
```

이렇게 코드가 조금 가벼워졌죠??  
그런데, 너무 다 생략하면 좋지 않습니다.  
매개변수로 무엇을 넘겨줘야하는지 헷갈릴 수 있거든요.😅

> 레이블과 전달하는 이름과 같을 때 사용하는 게 좋을 것 같네요.

```markdown
예를 들면,

- sing(song: song) 보다는 sing(song)
- enable(alarm: alarm) 보다는 enable(alarm)
- read(book: book) 보다는 read(book)

반복되는 이름이 사용될 때 밑줄을 이용하여 레이블을 생략해줍시다.

- greet(person: taylor)
- buy(item: toothbrush)
- find(user: customer)

요런 경우에는 레이블을 남겨주는게 좋겠죠?? 😁
```

<br>

🌱 네번째로, 매개변수 default값에 대해서 알아봅시다.  
타입 뒤에다가 등호를 사용해서 기본값을 설정해줄 수가 있어요.  
매개변수로 값을 넘겨주지 않으면 기본값이 사용되는 것이죠.

```swift
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

// nicely 매개변수는 생략해줄 수가 있는 거에요.
// default로 true가 넘어갑니다!

greet("Taylor")
greet("Taylor", nicely: false)
```

<br>

🌱 다섯번째로, 동일한 유형의 매개변수를 여러 개 허용하는 방법이 있습니다.  
`...`을 이용하면 전달된 값(매개변수)을 배열의 형태로 변환해줍니다.  
예시 코드로 함께 보시죠!

```swift
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

// 쉼표를 이용해서 많은 값을 구분해서 전달해줄 수 있습니다.
square(numbers: 1, 2, 3, 4, 5)

// 물론, 1개만 전달해줄 수도 있겠죠?
square(numbers: 1)
```

<br>

🌱 마지막으로 `inout` 키워드를 이용해서 전달받는 값 자체를 변경할 수 있는 방법에 대해서 알아보겠습니다.

```swift
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10

// & 기호를 붙여줘야 합니다.
// 뭔가 C언어의 주소 참조와 비슷한 것 같아요.
doubleInPlace(number: &myNum)

이렇게 되면 myNum이 직접적으로 변경이 됩니다.
20으로 말이죠
```

코드의 사용은 위와 같은데요! 타입 앞에 `inout`를 붙이면서  
외부 변수의 값을 직접적으로 수정할 수 있습니다.

정말 사용해야하는 경우가 아니라면, 일반적으로  
데이터를 보내고 다시 반환받도록 함수를 작성하는 것이 좋습니다.

<br>

### 3. 반환값 (return)

음, 매개변수에 대해서 배웠으니 반환값에 대해서도 배워볼게요.  
함수 내에서 수정된 값을 다시 돌려받아서 사용하고 싶을 때  
우리는 `return`이라는 키워드를 사용하게 됩니다.

```swift
// 화살표와 타입을 명시해주면서 이 함수는 반환값을 주겠다라고 알리게 됩니다.
func square(number: Int) -> Int {
    return number * number
}

let result = square(number: 8)
print(result) // 64
```

▶︎ 함수 안에 단일 표현식만 사용하게 된다면 return 키워드를 이용하지 않고도  
값을 반환할 수 있습니다.

```swift
func greet(name: String) -> String {
    "Oh wow! \(name)"
}

let str = greet(name: "taehyeon")
print(str) // Oh wow! taehyeon

// return을 안 썼는데도 값이 담깁니다!
```

💁🏻 두 개 이상의 값을 반환하고 싶을 때, 우리는 **튜플**을 이용해서 반환해줄 수 있습니다.

```swift
func getUser() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
}

let user = getUser()
print(user.first)
```

<br>

### 4. 오류처리, 예외처리

```markdown
오류처리에 관한 내용은 `EmilY`님의 블로그의 내용을 인용하였습니다.
너무 정리가 잘 되어 있어서 제가 따로 정리하는 것보다 내용 그대로 보면 좋을 것 같아서요!
아래에 출처 한 번 더 제시하겠습니다.
`EmilY`님께 감사의 말씀을 전합니다 :)
```

오류처리를 하는 데에는 3가지 과정이 필요한데요.

- 오류의 종류 정의하기
- 발생한 오류 던지기
- 던진 오류 처리하기

<br>

첫 번째로, 오류의 종류는 enum을 이용해서 정의해봅시다.  
꼭 오류 종류를 작성할 필요는 없습니다. 건너뛰어도 됩니다!

```swift
enum TestError : Error {
     case outOfRange                      // 1
     case invalidInput(testNum : Int)     // 2
}
```

<br>

두 번째로, 오류를 던질건데요! 이 때 `throws` 키워드를 이용합니다.  
'오류를 던진다'라는 말을 '오류를 처리하는 부분으로 가'라는 의미로 이해하면 좋을 것 같아요!

```swift
func printNumber(_ number: Int) throws -> Int {
   var text = ""

   guard number > 0 else {
       throw TestError.outOfRange
   }
   return text
}
```

리턴 타입 앞에 `throws`키워드를 써주시고, 오류가 발생할 구간에 `throw`키워드를 써줍시다!

<br>

세 번째로, 오류를 처리하기 위해서는 `do ~ catch`문을 이용합니다.  
오류를 처리하는 가장 간단한 방법인데요!

```swift
do {
   let resultNumber = try object.printNumber(-20)
} catch TestError.outOfRange {
   // 오류처리
   print("양수 X")
} catch TestError.invalidInput(let testNumber) {
   // 오류처리
   print("부적절한 숫자 \(testNumber)")
}

요렇게 처리를 할 수가 있겠습니다.

우선, try문의 의미는 에러가 발생할 수도 있는데 일단 한 번 시도하겠다! 라는 의미구요.

그렇다면, 에러가 발생하는 경우도 있겠죠? 이 때의 처리를 catch문에서 해주는 거에요.

우리가 처음에 케이스를 나누어주었으니, 오류 케이스에 따라서 오류처리를 구분해줄 수 있습니다.
```

```swift
아래처럼 switch문을 통해서 오류처리를 해주기도 합니다.

🙋🏻‍♂️ 저는 switch문 사용하는 것을 많이 본 것 같아요.

do {
   let resultNumber = try object.printNumber(-20)
} catch {
   switch error {
   case TestError.outOfRange:
       // 오류처리
   case TestError.invalidInput(let number):
       // 오류처리
   }
}
```

---

### 레퍼런스

[EmilY님 블로그 - [Swift] 예외처리 (throws, do-catch, try) 하기](https://twih1203.medium.com/swift-%EC%98%88%EC%99%B8%EC%B2%98%EB%A6%AC-throws-do-catch-try-%ED%95%98%EA%B8%B0-c0f320e61f62)
