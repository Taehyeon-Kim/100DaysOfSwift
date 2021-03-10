# Day 7 - 클로저(2)

Closures, part two

## 목차

- 알아야 할 최소한의 내용 🙂

  1. 전달하는 클로저에 매개변수 전달  
     `Using closures as parameters when they accept parameters`

  2. 전달하는 클로저가 값 반환  
     `Using closures as parameters when they return values `

  3. 매개변수 이름 축약 (약식 표현)  
     `Shorthand parameter names`

- 조금 심화된 내용 😩

  4. 여러 개의 매개변수가 있는 클로저  
     `Closures with multiple parameters`

  5. 클로저 자체를 반환하기  
     `Returning closures from functions`

  6. 값 캡처하기  
     `Capturing values`

- 레퍼런스  
  [The Swift Language Guide (한국어) - 클로저 (Closures)](https://jusung.gitbook.io/the-swift-language-guide/language-guide/07-closures)

---

<br>

### 1. 전달하는 클로저에 매개변수 전달

함수에 전달하는 클로저는 자체로 매개변수를 받을 수 있습니다.

- ( ) -> Void
- **(String) -> Void**

지금까지, 첫 번째와 같은 형태로만 사용했었는데 함수와 마찬가지로  
클로저가 매개변수를 받는 형태로 함수에 전달할 수 있습니다.

```swift
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}
```

<br>

### 2. 전달하는 클로저가 값 반환

함수에 전달하는 클로저가 값을 반환하는 형태일수도 있겠죠?

- ( ) -> Void
- (String) -> Void
- **(String) -> String**

```swift
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")  // 반환 값을 저장해주고 있네요!
    print(description)
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
```

위의 코드는 클로저가 반환하는 값이 문자열인 경우를 의미합니다.  
어렵게 생각할 필요없이 함수의 다른 형태라고 생각하면 좋을 것 같아요.  
함수처럼 매개변수도 넘길 수 있고, 값을 반환할 수도 있는거죠!

<br>

### 3. 매개변수 이름 축약 (약식 표현)

이 부분은 살짝 난해할 수 있는데 천천히 따라오면 이해할 수 있습니다 :)  
Swift는 클로저를 조금 더 축약된 형태로 작성할 수 있는 방법을 제공합니다.  
인라인 클로저에 자동으로 축약 인자(매개변수) 이름을 제공하는데요.  
천천히 따라가볼게요!

```swift
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

// 이 부분! 클로저를 한 번 축약해보겠습니다.
travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
```

```swift
// 1. 매개변수의 타입을 생략할 수 있습니다.
// Swift는 이미 매개변수 타입이 문자열이라는 것을 알고 있습니다.
travel { place -> String in
    return "I'm going to \(place) in my car"
}
```

```swift
// 2. 반환값(리턴값)의 타입을 생략할 수 있습니다.
// 마찬가지로 반환값 타입이 문자열이라는 것을 알고 있습니다.
travel { place in
    return "I'm going to \(place) in my car"
}
```

```swift
// 3. 실행 코드가 단일 라인이기 때문에 return 키 역시 생략할 수 있습니다.
travel { place in
    "I'm going to \(place) in my car"
}
```

```swift
// 4. 마지막으로 shorthand syntax라고 해서 코드를 조금 더 줄일 수 있는데요.
// place in을 생략하더라도 클로저의 매개변수(parameter)들이 자동으로 이름이 매칭됩니다.
// $(달러)사인에 의해서 매개변수에 이름이 매겨지는 데요.
// $0, $1, $2 ... 이렇게 전달받은 매개변수들이 0부터 순차적으로 매핑됩니다.
travel {
    "I'm going to \($0) in my car"
}
```

😄 종종 볼 경우가 생기더라구요! 차근차근 이해해보도록 합시다.

---

<br>

### 4. 여러 개의 매개변수가 있는 클로저

조금 심화되었다고는 하지만, 이 부분은 정말 이해하기 쉽습니다.  
클로저에도 매개변수를 여러 개 넘길 수 있다는 거에요!  
코드로 함께 봅시다.

```swift
// 쉼표로 구분해서 매개변수를 구분해주시면 됩니다.
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

// 인자 = 매개변수
// 아래처럼 축약된 인자 이름을 사용할 수 있어요.
// 2개의 인자가 넘어왔기 때문에 $0, $1 이렇게 매핑시켜서 사용하면 됩니다.
// 참 쉽죠? 🤓
travel {
    "I'm going to \($0) at \($1) miles per hour."
}
```

<br>

### 5. 클로저 자체를 반환하기

여기서부터는 조금씩 이해가 어려울 수 있을 것 같습니다.  
천천히 이해해볼게요.

클로저를 매개변수로 넘겨줄 수 있다면 마찬가지로 클로저를 반환할 수 있습니다.

```swift
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

다음 코드가 클로저를 반환하고 있는 형태인데요.

천천히 묶음으로 생각해보면 됩니다.

- travel이라는 함수에 어떠한 매개변수도 넘겨주지 않고 있고 : ( )
- 문자열을 매개변수로 받고 빈 값을 반환하고 있는 클로저가 반환되고 있습니다. : (String) -> Void
```

```swift
// 실행은 다음과 같이 할 수 있습니다.

// 1. 클로저를 반환한 다음에 함수로 호출하는 방법
let result = travel()
result("London")

// 2. 직접 반환값을 호출하는 방법 - (추천하지는 않는데요..)
let result2 = travel()("London")
```

아이고,, 여기서부터 조금 이해가 안 될 수 있지만 일단 한 번 훑는다고 생각하면 좋겠네요 😂

<br>

### 6. 값 캡처하기 (Capturing values)

마지막으로 값 캡처에 대한 내용입니다.  
클로저 내부에서 외부 값을 사용하는 경우 Swift는 이 값을 캡처합니다.  
클로저와 함께 저장되는 것인데요.  
원본 값이 사라지더라도 클로저 내부에서 그 값을 사용할 수가 있습니다.

```swift
func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result = travel()

result("London")
result("London")
result("London")

// 출력결과 - 카운터가 계속해서 올라갑니다.
// 1. I'm going to London
// 2. I'm going to London
// 3. I'm going to London
```

<br>

### 레퍼런스

- [The Swift Language Guide (한국어) - 클로저 (Closures)](https://jusung.gitbook.io/the-swift-language-guide/language-guide/07-closures)
