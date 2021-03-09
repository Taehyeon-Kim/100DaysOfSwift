# Day 6 - 클로저(1)

Closures, part one

## 주제

`Creating basic closures` · `기본 클로저 작성하기`  
`Accepting parameters in an closure` · `클로저에서의 매개변수`  
`Returning values from a closure` · `클로저에서의 반환값 `  
`Closures as parameters` · `클로저를 매개변수로 사용하기`  
`Trailing closure syntax` · `후행 클로저 문법`

---

🤔 클로저, 겁 먹지말고 들여다 봅시다!
<br>

### 1. 기본 클로저 작성

> 클로저란 무엇인가요?

클로저란 `func`키워드와 함수의 이름이 없는 함수입니다.  
`func`대신 `in`키워드가 존재하는데요!

```swift
// 간단하게 생각해서 괄호로 묶여있는 부분인데요.
// 이름없이 함수를 만들고 해당 함수를 driving에 할당하고 있습니다.
let driving = {
    print("I'm driving in my car")
}

driving()
```

```swift
기본적으로 아래와 같은 형식을 따릅니다!

{ (매개변수 목록) -> 반환타입 in
    실행 코드
}
```

▶︎ 클로저는 상당히 많은 곳에서 사용되고 있습니다!  
`completion block` `callbacks 고차함수` 등등이 있습니다.

▶︎ 클로저를 사용하는 가장 일반적인 이유 중 하나는 기능을 저장하는 것입니다.  
나중에 수행을 시킬건데 지금 당장은 필요하지 않을 수가 있기 때문인데요.

- delay 후에 일부 코드 실행
- 애니메이션이 완료된 후에 일부 코드 실행
- 다운로드 완료 후에 일부 코드 실행
- 사용자가 메뉴에서 옵션을 선택했을 때 일부 코드 실행

등등의 경우가 존재합니다 :)

<br>

### 2. 클로저 매개변수

클로저에서도 함수와 마찬가지로 매개변수를 받아들일 수가 있는데요.
함수와 작성 방법이 다릅니다. 아래 코드로 함께 보시죠!

```swift
let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving("London")
```

- 시작되는 괄호와 `in` 키워드 사이에 매개변수 목록을 적어주면 됩니다.
- 클로저를 실행할 때는 매개 변수 레이블을 적지 않습니다.

<br>

### 3. 클로저 반환값

클로저 역시 값을 반환할 수 있습니다.  
매개변수 다음에 화살표를 작성해주고 반환하는 값의 타입을 명시해줍니다.  
그리고 `return` 키워드를 사용해서 값을 반환합니다.

```swift
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)
```

✓ 매개변수 없이 값을 반환하려면 빈 괄호를 작성해주어야 합니다!

```swift
let payment = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}
```

<br>

### 4. 클로저를 매개변수로 사용하기

클로저는 매개변수로 넘겨질 수가 있는데요!  
살짝 이해가 안가더라도 반복해서 보면 좋을 것 같습니다.

```swift
let driving = {
    print("I'm driving in my car")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

// 실행 방법 1
travel(action: driving)

// 실행 방법 2 (후행 클로저 사용)
travel() {
  // code
  print("Im driving in my car")
}
```

<br>

### 5. 후행 클로저 문법

함수에 대한 마지막 매개 변수가 클로저인 경우 우리는 후행 클로저라는 특수 구문을 이용할 수 있어요.  
클로저를 매개 변수로 전달하는 대신 중괄호 안의 함수 바로 뒤에 전달하는 것입니다!

```swift
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

// 마지막 매개 변수가 클로저이기 때문에 후행 클로저 구문을 사용할 수 있습니다.
animate(duration: 3, animations: {
    print("Fade out the image")
})

// 아래와 같이 레이블을 생략할 수도 있어요!
animate(duration: 3) {
    print("Fade out the image")
}
```

<br>

### 레퍼런스

[이동건님 블로그 - [Swift] Closure [01]](https://baked-corn.tistory.com/11)
