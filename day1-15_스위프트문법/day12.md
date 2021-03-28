# Day 12 - 옵셔널

Optionals
`optionals`, `unwrapping`,`typecasting`

## 목차

1. 옵셔널  
   `Optionals` 

2. 언래핑 
   `Unwrapping`

3. nil 병합 연산자(?!)   
   `Nil coalescing`

4. 옵셔널 체이닝
   `Optional chaining`

5. 옵셔널 try (옵셔널 에러 처리)
   `Optional try`

6. 실패할 수 있는 이니셜라이저
  `Failable initializers`

7. 타입캐스팅 (타입 강제 변환)
  `Typecasting`

<br>

### 1. 옵셔널 `Optionals`

```
당신이 만약에 Int형을 사용해서 사용자의 나이를 저장하는 변수를 선언했다고 생각해봅시다.  
만약에 사용자의 나이를 모른다면 우리는 어떻게 해야할까요?  
우선, 나이를 모르기 때문에 구체적인 값을 저장하지 못합니다.  
그렇다면 우리는 0을 저장해야할까요?

Swift에서는 이러한 문제를 해결하기 위해서 솔루션을 제공합니다.
```

바로 Optionals(옵셔널)이라는 유형을 만들 수 있는데요.

```swift
var age: Int? = nil
```

다음과 같이 물음표를 이용해서 옵셔널이라는 표시를 해줄 수 있고,  
아무런 값이 없을 때는 nil로 나타낼 수 있습니다.

<br>

### 2. 언래핑 `Unwrapping`

① 언래핑 1 - if let
```swift
var name: String? = nil

// 만약 여기서 count라는 속성을 사용하려고 한다면
// nil이 있기 때문에 빈 메모리 임을 알 수 있습니다.
// 그렇기 때문에 어떠한 것도 실행할 수가 없죠!
name.count
```

```swift
// 이렇기 때문에 우리는 일반적으로 언래핑이라는 방법을 사용할 수 있습니다.
// 이 중 if let 구문을 사용할 수가 있는데요~

// 만약에 nil이 아닌 실제 값이 존재한다면 if 문에 맞게 코드를 실행할 수 있고,
// 그렇지 않다면 그 외의 처리를 해줍니다.
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

```

② 언래핑 2 - guard let

언래핑 방법으로 guard let 구문을 이용할 수도 있습니다.  
guard let 구문을 사용하면 함수 시작시 문제를 처리한 다음에 즉시 종료가 가능합닌다.

```swift
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
```

③ 언래핑 3 - 강제 언래핑

만약에 우리가 어떠한 값이 nil이 아니라고 확실히 알고 있는 경우 옵셔널을 강제로 풀 수 있습니다.   
이를 우리는 강제 언래핑(force unwrapping)이라고도 부릅니다.  
예를 함께 볼까요?

```swift
// 예를 들어 숫자가 포함된 문자열이 있으면 우리는 Int로 타입 변환을 할 수 있습니다.
let str = "5"
let num = Int(str)

// 우리가 num이라는 변수에 반드시 정수만 담긴다는 것을 알고 있다면
let num = Int(str)! 

// 위와 같이 작성할 수 있습니다.
// Int?로가 아닙니다.
```

④ 언래핑 4 - 명시적 언래핑

명시적(암시적) 언래핑은 값을 가질 수도 있고 nil을 가질 수도 있습니다.  
```swift
let age: Int! = nil
```

이미 Wrapping이 해제된 것처럼 동작하기 때문에 if let 이나 guard let을 사용할 필요가 없습니다.

<br>

### 3. nil 병합 연산자(?!) `Nil coalescing`

nil 병합 연산자는 선택 사항, 즉 옵셔널을 풀고 값이 있는 경우 값을 반환하고,  
그렇지 않은 경우 기본 값을 반환합니다.  
간단하게 생각해서 값이 없는 경우 기본값을 반환합니다.  
백업 같은 역할이죠!

```swift
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

// 위와 같이 옵셔널로 반환값을 선언해줬다면
// 만약 값이 없는 경우는 ?? 사용해서
// 기본값을 반환해줍니다.
let user = username(for: 15) ?? "Anonymous"
```

<br>

### 4. 옵셔널 체이닝 `Optional chaining`

옵셔널 체이닝은 타고타고 들어가다가 중간에 nil을 만나면 바로 반환하는 것인데요!  
무슨 말인지 전혀 모르실 수 있습니다.  
예시로 같이 보시죠

```swift
let names = ["John", "Paul", "George", "Ringo"]

// 우리는 그 속성을 타고 타고 들어갈건데 (이 때 .으로 타고 들어갑니다.)
// first라는 배열의 속성을 사용할거에요
// 만약에 원소가 하나만 있거나 아무것도 없다면(Nil)이라면 단순히 names 배열을 반환합니다.

let beatle = names.first?.uppercased()
```

<br>

### 5. 옵셔널 try `Optional try`

우리는 이전에 do, try, catch에 대해서 알아봤는데요.  
옵셔널을 배운 뒤라 조금 더 이해할 수 있을 것 같습니다.

```swift
// 기본 예제
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
```

```swift
// 물음표를 이용할 수 있습니다.
// 만약 함수에서 오류가 발생하면 nil결과가 전송되고
// 그렇지 않으면 반환값이 옵셔널 래핑됩니다.
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
```

```swift
// 다음처럼 함수가 실패하지 않는다는 것을 안다면
// 에러가 발생하지 않는다는 것을 안다면
// try!문을 이용할 수 있습니다.
try! checkPassword("sekrit")
print("OK!")
```

<br>

### 6. 실패한 이니셜라이저(?) `Failable initializers`

우리는 이니셜라이저에서도 ?를 이용해서 표기할 수 있습니다.  
길이가 9자인 문자열 이외의 것이 사용되면 nil을 반환하고,  
그렇지 않다면 정상적으로 작동합니다.

```swift
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}
```

<br>

### 7. 타입캐스팅(형변환) `Typecasting`

코드부터 바로 보시죠!

```swift
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]
```

다음 코드를 보면 Fish와 Dog 클래스가 Animal 클래스로부터 상속을 받는 것을 알고 있습니다.  
pets라는 배열은 그렇다면 Animal이라는 클래스를 상속받고 있다고 생각해도 될까요? 
pets 배열을 반복하면서 makeNoise라는 메서드를 호출하고 싶다면 우선 확인을 해봅니다.  
적절한 것을 상속받고 참조하고 있는지!

```swift
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
```

as? 라는 새로운 키워드를 사용합니다!