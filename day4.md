# Day 4 - 루프(반복문)

Loops

## 주제

`For loops` · `For 루프`  
`While loops` · `While 루프`  
`Repeat loops` · `Repeat 루프`  
`Exiting loops` · `루프 탈출`  
`Exiting multiple loops` · `중첩 루프 탈출`  
`Skipping items` · `항목 건너 뛰기`  
`infinite loops`· `무한 루프`

### 1. 루프

```markdown
Swift에는 루프를 작성하는 방법이 몇 가지 존재합니다.  
루프는 반복되는 구간이라고 이해하면 좋을 것 같습니다.  
조건을 만족할 때까지(`참`일동안) 코드를 반복적으로 실행합니다.
```

① for 루프  
일반적으로 사용하는 for 루프에 대해서 알아봅시다.

```swift
// 1.
다음과 같이 범위를 1부터 10까지로 지정하겠습니다.
let count = 1...10

범위내에서 코드를 반복해서 실행합니다.
for number in count {
  // 문자열 보간을 이용하고 있네요?
  print("Number is \(number)")
}

10까지 반복해서 실행하겠죠?
// "Number is 1"
// "Number is 2"
// ...
// "Number is 10"
```

```swift
// 2.
배열에서도 동일하게 할 수 있습니다. (튜플에서는 반복문 사용할 수 없어요..!)
let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

배열에 있는 요소를 하나씩 탐색합니다.
// "Red is on Apple Music"
// "1989 is on Apple Music"
// "Reputation is on Apple Music"
```

```swift
// 3.
단순 반복만하고 싶은 경우엔 for 루프에서 제공하는 상수를 만들지 않고 _ (밑줄)을 사용합니다.
밑줄을 사용하면 실제로 변수가 필요하지 않음을 인식하고 임시 상수를 만들지 않습니다.


for _ in 1...5 {
    print("play")
}

// play가 5회 출력됩니다.
// "play"
// ...
```

<br>

② while 루프  
2번째 방법은 while 루프를 이용하는 것입니다.  
for 루프와 매커니즘은 동일합니다.  
검사할 조건을 지정하면 조건이 거짓일때까지 루프를 돕니다.

```swift
다음과 같이 문법을 이용할 수 있습니다.
while 조건 {
  // 실행할 코드
}
```

```swift
// 숨바꼭질 게임 → 숫자 세기
var number = 1

// 20일때까지 숫자를 세면서 늘려나간다.
// 20보다 작거나 같을때까지는 while 루프를 반복합니다.
while number <= 20 {
    print(number)
    number += 1
}

// 이제 찾는다 ~
print("Ready or not, here I come!")
```

- 그럼 언제 while 루프를 사용해야할까요?
  - 사용자가 중지를 요청할 때까지
  - 서버가 중지할 때까지
  - 원하는 답을 찾을 때까지
  - 충분한 데이터를 얻을 때까지

> for 루프는 유한한 범위와 함께 사용이 되지만, while 루프는 원할 때까지 반복할 수 있습니다.

<br>

③ Repeat 루프  
3번째 방법은 repeat 루프를 사용하는 것입니다. 일반적으로 잘 사용되지는 않는다고 합니다.  
다른 프로그래밍 언어에서의 do ~ while 루프랑 비슷한 것 같은데요.

```swift
// 예시 코드를 함께 보시면

var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

// while 루프와는 다르게 조건이 끝에 오기 때문에
// 루프 내부의 코드는 적어도 한 번 이상은 실행됩니다.
```

```swift
// shuffled()함수를 이용해서 숫자를 섞는 예제
// 섞은 배열이 이전과 동일하다면 다시 섞는다.

let numbers = [1, 2, 3, 4, 5]
var random = numbers.shuffled()

while random == numbers {
    random = numbers.shuffled()
}

// repeat 루프를 사용하면 반복되는 코드를 줄일 수 있습니다.

let numbers = [1, 2, 3, 4, 5]
var random: [Int]

repeat {
    random = numbers.shuffled()
} while random == numbers
```

<br>

### 2. break 키워드 (루프 탈출)

루프를 반복하는 도중 루프를 빠져나오고 싶은 경우가 분명이 존재하겠죠?  
`break` 키워드를 이용하면 루프를 탈출할 수가 있습니다.  
아래 예시코드로 함께 보겠습니다.

```swift
// 10부터 카운트다운을 시작하다가 중간에 4가 되었을 때 탈출하는 예시입니다.

var countDown = 10

while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")

        // 요기 break 키워드가 보이네요. 탈출구라고 이해하시면 좋을 것 같네요.
        // 이 부분을 만나면 가장 가까운 루프를 빠져나가게 됩니다.
        break
    }

    countDown -= 1
}
```

<br>

### 3. 중첩 루프 탈출

```
루프 내부에 또 다른 루프를 넣으면 중첩 루프라고 합니다.
내부 루프와 외부 루프를 동시에 종료하는 것은 흔치 않은 일인데요.
한 번 동시에 루프를 나가는 방법에 대해서 알아보도록 합시다.
```

중첩 루프를 탈출하기 위해서는 레이블을 달아주어야 하는데요.  
(레이블 이름은 자유롭게 작성해주시면 됩니다 👍!!)  
예시를 한 번 보도록 할게요

```swift
// 자 외부 루프에 myLoop라고 레이블을 달아주고
myLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!") // bullseye가 정중앙을 의미한다고 하네요 ..ㅎ
            break myLoop           // break + 레이블 이름 해주면 외부 루프를 탈출하게 됩니다.
        }
    }
}

// 출력 결과
// 1 * 1 is 1
// 1 * 2 is 2
// ...
// 5 * 9 is 45
// 5 * 10 is 50
// It's a bullseye!
```

<br>

### 4. continue 키워드 (항목 건너 뛰기/계속)

코드 실행을 건너뛰는 방법이 있는데 우리는 이 때 `continue`키워드를 이용할 수 있습니다.  
코드로 바로 보시죠!!

```swift
// 홀수일때는 코드실행을 건너뛰는 예제입니다!

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}
```

<br>

### 5. 무한 루프

무한 루프를 만들기 위해서는 while 루프를 사용하는 것이 일반적입니다.  
무한 루프는 끝이 없거나 특정 조건이 되었을때만 끝나는 루프입니다.

`true`를 이용해서 항상 조건을 참으로 만들어주면 while 루프를 무한히 돌게 됩니다.  
특정 조건을 걸어서, 그 조건을 만족할 때 종료하도록 해주면 됩니다.

```swift
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
```

```
🧐 일반적으로 무한 루프는 iPhone 앱에서 거의 대부분 사용되고 있습니다.
앱이 시작되고 앱이 종료될 때까지 서비스는 계속해서 유지가 되어야 할 것입니다.
게임을 하거나 특정 앱을 이용할 때 사용자가 언제 앱을 종료할 것인지 모르기 때문에
계속 반복해서 실행되어야 겠죠?
```
