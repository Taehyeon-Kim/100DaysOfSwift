# Day 14 - 스위프트 복습(2)

함수, 옵셔널, 열거형, 구조체와 클래스

## 주제

1. 함수 (Functions)

2. 옵셔널 (Optionals)

3. 옵셔널 체이닝 (Op₩₩tional chaining)

4. 열거형 (Enumerations)

5. 구조체 (Structs)

6. 클래스 (Classes)

---

<br>

### 1. 함수

```markdown
1) 함수를 왜 사용할까
가정을 하나 해보죠. 우리는 코드를 함수 없이 길게 나열해서 작성하고 있습니다. 그러던 중 여러 개의 반복되는 코드에서 수정할 부분이 생겼어요. 일일이 다 바꿔주기에는 그 작업이 쉽지 않습니다. 중간에 빼먹을 수도 있고, 시간이 오래 걸리기 때문이죠. 

여기에서 함수의 장점이 나옵니다. 반복되는 코드를 하나의 영역, 즉 함수로 만들어서 인스턴스를 생성하는 것으로 다시 바꾸어 보겠습니다. 

수정할 부분이 생기면 일괄적으로 업데이트가 가능해지겠죠? 놓치는 부분 없이 반복되는 부분을 바꿔줄 수 있고 시간도 그만큼 줄일 수 있습니다!
```
```swift
2) 함수의 매개변수 (parameter)
라벨링이라고 불리는 매개변수의 이름을 붙여주는 방식을 4가지로 나누어 볼 수 있을 것 같습니다.

// 1 - 일반적인 방식
func countLettersInString(string: String) {
    print("The string \(string) has \(string.count) letters.")
}

// 1번 같은 경우는 그 의미가 약간 애매모호 합니다.
countLettersInString(string: "Hello")

// 2 - 외부 + 내부 이름을 정해줄 수 있습니다.
// 외부 이름 : myString, 내부 이름 : str
func countLettersInString(myString str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString(myString: "Hello") 

// 3 - 외부 이름 생략 
// 언더바(_)를 사용하면 외부 이름을 생략할 수 있습니다.
func countLettersInString(_ str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString("Hello")

// 🦊 4 - 의미 있는 이름 부여
func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}

// 전치사를 사용하면 그 의미를 좀 더 명확히 해줄 수 있을 것 같습니다.
// 'Hello의 안의 문자를 세라' 라는 의미로 해석할 수 있겠네요
countLetters(in: "Hello")
```
```swift
3) 함수의 반환값 (return)
// -> (화살표)를 이용해서 함수에서 반드시 반환해야 할 값의 유형을 명시해줄 수 있습니다.
func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    if name == "Speak Now" { return true }
    if name == "Red" { return true }
    if name == "1989" { return true }

    return false
}

// 👍 요즘 Switch ~ case 문에 대해서 많이 경험하고 있는데요.
// 확실히 가독성이 좋아지는 장점이 있는 것 같습니다.
// 적절한 곳에서 사용하도록 합시다!
switch name {
  case "Taylor Swift":
    return true
  case "Fearless":
    return true
  case "Speak Now":
    return true
  case "Red":
    return true
  case "1989":
    return true
  default:
    return false
}
```

<br>

### 2. 옵셔널

```swift
1) 옵셔널 너란 녀석은?
Swift는 안전한 언어입니다. 최대한 자체적으로 안전한 처리를 하려고 하죠. 그러한 처리 중에서 어쩌면 가장 중요한 방법 중에 하나인 옵셔널을 정리해보겠습니다. 옵셔널은 값이 있을 수도 있고, 값이 없을 수도 있음을 표현하기 위한 키워드입니다.

실제로 Swift에서는 일반 변수에 값이 없음을 의미하는 nil을 대입하면 에러를 발생시킵니다. 그런데 항상 값이 있을 수는 없잖아요? 없을 때는 어떻게 하냐! 이 때 옵셔널을 이용해서 표현해줍시다.
```

```swift
var teamName: String?

변수가 의미하는 것을 그대로 해석해보면 팀 이름이 지금 있을 수도 있고 없을 수도 있음을 의미합니다. 옵셔널 (?) 키워드가 붙어있기 때문이죠.
```

```swift
2) 옵셔널 해제 방법
- 옵셔널 바인딩
  - if let {} else {}
  - guard let ~ else {}
- 강제 언래핑 (Force unwrapping optionals) - 사용시 !로 풀어주기
- 암시적 언래핑 (Implicitly unwrapped optionals) - 선언 시 미리 명시
```

```swift
3. 옵셔널 체이닝
옵셔널을 모두 확인하고 해제하는 과정이 약간 번거로워질 수 있을 것 같습니다.  
해결 방법으로 옵셔널 체이닝을 이용할 수 있는데요
```

```swift
let album = albumReleased(year: 2006)?.someOptionalValue?.someOtherOptionalValue?.whatever

// 위와 같은 코드가 있을 때
// 옵셔널 체인으로 연결되어 있는 코드는 왼쪽에서 오른쪽으로 옵셔널을 체크해나갑니다.
// 중간에 체크하다가 값이 없다면, 즉 nil이라면 즉시 nil을 반환해줍니다.
// 깔끔하게 옵셔널을 체크해줄 수 있겠죠.
```

```swift
4. nil 병합 연산자
??를 사용해서 값이 있을 때 사용할 값과 없을 때(nil일 때) 사용할 값을 정해줄 수 있습니다. 

let album = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album)")
```

<br>

### 3. 열거형

```swift
열거형은 사용자가 스스로 타입을 만들 수가 있고, switch ~ case와 사용할 때 그 빛을 냅니다.
이 부분은 많이 사용해봐야할 것 같습니다. 내용에 대해서 자세히 알고 싶으시면 이전 글을 참고해주세요.

// 선언과 사용방법입니다.
enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getHaterStatus(weather: WeatherType.wind(speed: 5))
```

<br>

### 4. 구조체와 클래스

```
차이만 간단히 짚어보겠습니다.
해당 부분은 나중에 하나의 토픽으로 정리하는 것이 좋아보입니다! 😀

구조체
  - call by value : copy and write (값 자체 복사)
  - 상속 불가능
  - stack memory (속도 빠름)
  - 기본 이니셜라이저 제공
  - AnyObject로 타입 캐스팅 불가능
클래스
  - call by reference : memory address copy
  - 상속 가능
  - heap memory에 할당 (속도 느림)
```