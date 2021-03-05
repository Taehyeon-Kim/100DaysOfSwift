# Day 2 - 스위프트 기초

Complex data types(복잡한 자료형)

## 주제

`Arrays` · `배열`  
`Sets` · `집합`  
`Tuples` · `튜플`  
`Arrays vs sets vs tuples` · `배열/집합/튜플`  
`Dictionaries` · `딕셔너리`  
`Dictionary default values` · `딕셔너리 기본 값`  
`Creating empty collections`· `빈 컬렉션 만들기`  
`Enumerations`· `열거형`  
`Enum associated values`· `열거형 연관값`  
`Enum raw values`· `열거형 원시값`
<br>

### 01. Arrays(배열)

배열은 단일 값으로 저장되는 **값의 모음**입니다.  
**많은 값을 저장**하기 위해 배열을 사용합니다.

```swift
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

// 비틀즈의 멤버를 배열로 만들어봅시다.
let beatles = [john, paul, george, ringo]
```

▶︎ 인덱스

- 배열에서 중요한 것은 인덱스(위치를 의미)입니다.
- 인덱스는 0부터 시작합니다.
- 예) george를 얻고 싶으면 beatles[2]와 같이 접근합니다.

▶︎ 인덱스 범위

- 인덱스가 범위를 넘어가거나 하면 충돌이 발생합니다.
- 예를 들어서, beatles[5] or beatles[9]과 같이
- 배열에 존재하지 않는 값에 접근하려고 하면 충돌(에러)이 발생합니다.

▶︎ 타입 어노테이션 (타입 명시)

- day 1에서 배웠던 type annotation을 이용해 배열을 선언해줄 수 있습니다.

```swift
let ex1: [Int] = []      // int로 이루어진 배열
let ex2: [String] = []  // string으로 이루어진 배열
let ex3 = Array<Double>()  // double으로 이루어진 배열
let ex4 = [Bool]()    // bool로 이루어진 배열
```

<br>

### 02. Set(집합)

집합 역시 값의 모음을 의미합니다.  
배열과 다른 점은 아래와 같습니다.

- 항목들의 순서를 보장하지 않습니다. 실제로 생성한 순서와 출력하는 순서가 달라집니다.
- 모든 항목은 고유해야합니다. 한마디로 중복을 허용하지 않습니다.

```swift
// #1
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])

// output
// {"blue", "green", "red"} : 순서 보장 X
// {"green", "red", "blue"} : 중복 허용 X

// #2
let earthquakeStrengths = Set(1, 1, 2, 2)   //(X)
let earthquakeStrengths = Set([1, 1, 2, 2]) //(O)

// 집합을 만들기 위해서는 항목의 배열을 전달해주어야 합니다!
```

▶︎ 집합과 배열

간단하게 생각해서 집합을 사용하기 적절한 경우는  
"이 항목이 있습니까?"에 대한 답을 하고 싶을 때 입니다.  
예를 들어, 단어가 사전에 있는지 확인하려면 집합이 더 좋겠죠.  
**💁🏻 중복이 없고, 배열보다 빠른 조회가 가능하니까요.**

<br>

### 03. Tuples(튜플)

▶︎ 배열과 차이점은 다음과 같습니다.

- 항목을 추가하거나 제거할 수 없습니다. (크기가 고정되어 있습니다.)
- 튜플의 element type(항목의 유형)은 변경할 수 없습니다.
- 숫자 위치나 이름으로 튜플 항목에 접근할 수 있지만, 존재하지 않는 값은 읽을 수 없습니다.(🤔 너무 당연한가요?)

```swift
// 3번째 설명에 대한 코드입니다.
var name = (first: "Taylor", last: "Swift")

name.0      // 인덱스처럼 숫자 위치로 접근할 수 있습니다.
name.first  // 튜플에는 이름이 존재하는데, 이름으로도 접근할 수 있습니다.
```

<br>

### 04. Array vs Set vs Tuple

3가지를 어떨때 사용할 수 있는지 아래 코드로 간단하게 살펴보겠습니다.  
일반적으로 셋 중에서, 배열을 가장 많이 사용하는 것 같습니다.

```swift
// tuple(튜플)
// 각 항목이 정확한 위치나 이름이 있는 고정된 컬렉션을 만들고 싶을 때
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

// set(집합)
// 중복없이 고유한 값들을 모으고 싶을 때, 특정 항목이 있는지 없는지 빠르게 확인하고 싶을 때
let set = Set(["aardvark", "astronaut", "azalea"])

// array(배열)
// 중복을 포함할 수 있게 값들을 모으고 싶을 때, 항목들의 순서가 중요할 때
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
```

▶︎ 그 외에 언제 사용할 수 있는지 생각해보면!

- set: 게임을 위한 사전에 모든 단어 목록을 저장(중복이 없고, 순서가 중요하지 않다면)
- set: 사용자가 읽은 모든 기사를 저장(순서는 중요하지 않고, 읽었는지 여부만 중요하다면)
- array: 사용자가 읽은 모든 기사를 저장(순서가 중요하다면)
- array: todolist에 대한 항목을 저장(순서가 영향을 미친다면)
- tuple: 2개의 string, 2개의 int, 3개의 bool 등의 컬렉션(정확히 고정된 값을 모으고 싶다면)

🤓 더 많은 예시들이 있겠지만, 중요한 포인트는 프로그램을 작성할 때 적절한 자료형을 선택하는 것이겠죠!

<br>
▶︎ 적절한 예시를 선택하는 문제를 풀어보는 것도 좋을 것 같습니다.

```
1번부터 4번까지는 배열을 사용하기 적절한 예시를 고르는 문제입니다.

#1.
사용자 연락처
채팅 프로그램에서의 메시지

#2.
퍼즐 게임안에서의 단어 목록
다음 10일 동안의 날씨정보

#3.
시의 각 행들
사용자의 로그인 기록 여부

#4.
앨범안의 노래
현재 기온

#5.
어린이의 월별 키 측정
트위터의 모든 사용자 이름 목록

#6.
비디오 게임에서 최고점
사람의 이름
```

`정답: 2,2,1,1,1,1`

<br>

### 05. Dictionaries(딕셔너리·사전)

딕셔너리도 배열과 마찬가지로 값의 모음입니다.  
가장 큰 차이점은 인덱스가 아닌 원하는 것으로 항목에 접근할 수 있습니다.  
일반적으로 문자열을 많이 사용합니다.

```swift
// 각 항목은 쉼표로 구분하며, 여러 항목을 가질 수 있어요.
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

// 접근은 요런식으로 할 수 있어요.
heights["Taylor Swift"]
```

▶︎ 특징

- 배열처럼 대괄호가 사용됩니다.
- 딕셔너리는 `[Key: Value]`로 구성되구요. (콜론으로 key/value가 한쌍을 이룹니다.)
- Key 값을 이용해서 원하는 값에 접근할 수 있습니다.
- 특정 순서로 항목을 저장하지 않기 때문에 항목에 대한 빠른 검색이 가능합니다.
- Key가 반드시 존재한다는 보장이 없기 때문에 아무것도 반환되지 않을 수 있습니다. (`nil`)  
  (존재하지 않는 키를 요청했을 수가 있는거죠.)

▶︎ type annotation의 경우 [String: Double] or [String: String]... 처럼 사용가능합니다.

<br>

### 06. 딕셔너리의 default value

- 딕셔너리에 존재하지 않는 Key 값을 이용해서 값을 읽으려고 할 때
- 사전은 `nil`을 반환하게 됩니다.

```swift
// 위의 경우를 막기 위해서 기본값을 설정해줄 수 있습니다.

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

// 찾고자 하는 키가 존재하지 않으면,
// nil이 아니라 default값으로 "Unknown"이 반환됩니다.
favoriteIceCream["Charlotte", default: "Unknown"]
```

<br>

### 07. 빈 컬렉션(collection)만드는 법

일반적으로 한 곳에 값을 모으는 자료형들을 컬렉션이라고 부릅니다.  
ex. `array` `set` `dictionary` → `collections`

빈 컬렉션을 만드는 방법이 있는데요. 아래의 코드로 함께 보시죠.

```swift
import UIKit

// 빈 사전을 선언하는 방법
/// 1
var teams  =  [String: String]()
teams["Paul"] = "Red" // 딕셔너리는 이렇게 값을 추가할 수 있습니다.
print(teams)

/// 2
// 여기서는 중요한 것이 key, value의 구분이 콜론(:)이 아니라 쉼표(,)라는 점!
var scores = Dictionary<String, Int>()

// 빈 배열을 선언하는 여러가지 방법
var arr0: [Int] = []
var arr1 = [Int]()
var arr2 = Array<Int>()

// 빈 집합을 선언하는 방법
var set1 = Set<String>()
var set2 = Set<Int>()
```

<br>

### 08. Enum(Enumeration - 열거형)

① Enum이 뭔데?  
▶︎ 연관·관련된 값들의 집합을 공통된 타입으로 정의하는 것입니다.  
하나의 타입을 새로 만든다고도 생각할 수 있을 것 같습니다.

▶︎ 한정된 경우의 수를 정의할 때 사용하는 것이 적절합니다.  
`요일`·`행성`·`기분`·`방위`·`error types`·`영화장르`·`포커카트종류`·`12달` 등등

▶︎ 열거형의 이름은 주로 단수형(첫글자 대문자)을 사용합니다.

▶︎ 🧐  
열거형을 사용하면 실수를 방지할 수 있습니다.  
예를 들어서, 작업의 실패를 "failure"와 같은 문자열로 표현하고 싶은데  
누군가 실수로 "failed", "fail"등의 문자열을 사용한다면 안되겠죠!

이럴 때 Result라는 열거형을 만들어서 새롭게 타입을 정의한다면  
미연의 실수를 방지할 수 있을 것입니다.

```swift
let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure // "failure"
```

② Associated Values (연관값)  
열거형(enum)은 각 케이스에 연결된 값을 저장할 수도 있습니다.  
추가 정보를 첨부해서 데이터를 좀 더 디테일하게 표현할 수가 있는거죠.

```swift
enum Activity {
    case bored
    case running
    case talking
    case singing
}

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")
```

요렇게 case 바로 뒤에 괄호를 이용해서 정보를 추가해줄 수 있습니다.  
연관값을 이용하면 케이스당 하나의 값이 아닌 여러 값/형식을 저장할 수가 있습니다.  
(하나의 케이스로 여러 정보를 표현할 수가 있겠죠?)  
뒤에서 이야기 할 원시값의 한계점을 극복할 수가 있습니다 😁 👍

③ Raw Values (원시값)

- 의미를 갖도록 열거형에 값을 할당할 수가 있는데 이를 원시값이라고 부릅니다.
- 원시값을 저장하는 것은 필수가 아닙니다.

▶︎ 원시값의 타입은 `Number`, `String`, `Character` 3가지만 사용할 수 있습니다.

▶︎ Number Type의 경우를 예시로 들어보겠습니다.

```swift
// Number type의 경우 기본적으로 아무 값도 할당하지 않았을 때
// 0부터 시작하는 숫자를 자동으로 할당합니다.
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

// 0부터 시작했을 때, 2에 해당하는 case는 earth임을 알 수 있습니다.
let earth = Planet(rawValue: 2)

Planet.mercury.rawValue // 0
Planet.venus.rawValue   // 1
Planet.earth.rawValue   // 2
Planet.mars.rawValue    // 3

Planet(rawValue: 100) // 다음과 같이 매칭되는 case가 없으면 nil을 반환합니다.
```

▶︎ String Type의 경우 원시값 할당을 생략하면 case 이름과 동일한 문자열이 원시값으로 저장됩니다.  
▶︎ Character Type의 경우 원시값 할당을 항상 해주어야 합니다.

<br>
<br>

### 레퍼런스

[Enum 열거형 정복하기 1편 - 염염(FLIP)님 블로그](https://onelife2live.tistory.com/13)
