# Day 10 - 클래스

Classes  
`classes`, `inheritance`

## 목차

1. 클래스 생성하기  
   `Creating your own classes`

2. 클래스 상속  
   `Class inheritance`

3. 오버라이딩(재정의) 메서드  
   `Overriding methods`

4. Final 클래스  
   `Final classes`

5. 객체 복사  
   `Copying objects`

6. 소멸자  
   `Deinitializers`

7. 가변성  
   `Mutability`

---

<br>

### 1. 클래스 생성하기 `Creating your own classes`

클래스와 구조체의 첫 번째 차이점은 멤버별 이니셜라이저를 제공하지 않는다는 점입니다.  
그렇기 때문에 프로퍼티가 있는 경우 항상 고유한 이니셜 라이저를 만들어주어야 합니다.

```swift
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// 클래스의 인스턴스를 만드는 것이 마치 구조체를 만드는 것처럼 보이네요!
let poppy = Dog(name: "Poppy", breed: "Poodle")
```

<br>

### 2. 클래스 상속 `Class inheritance`

클래스와 구조체의 두 번째 차이점은 상속이 가능하다는 것입니다.  
기존 클래스를 기반으로 새로운 클래스를 만들 수 있다는 것이죠!

`inheritance` 또는 `subclassing`이라고 불립니다!  
상속해주는 클래스가 부모(parent) 또는 수퍼(super)클래스이고, 상속받는 클래스가 자식(child)클래스랍니다.

```swift
// 위에서 만들었던 Dog 클래스로부터 상속받아
// Poodle이라는 새로운 클래스를 만들어보았습니다.
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

// Poodle 자체 클래스에서 이니셜라이저를 제공할 수도 있습니다.
// 우리는 항상 Poodle이라는 종을 가질 것이므로
// 부모 클래스의 init함수를 호출해서 초기화를 시켜주고 있습니다!
```

<br>

### 3. 오버라이딩(재정의) 메서드 `Overriding methods`

자식 클래스(상속받은 클래스)는 부모 클래스의 메서드를 재정의 할 수 있습니다.  
`func` 앞에 `override` 키워드를 붙여주어 사용하게 됩니다.

```swift
// 예를 들어서, Dog라는 클래스가 있습니다.
// makeNoise라는 함수는 개의 특성에 맞추어 Woof라는 울음소리를 출력하고 있습니다.
class Dog {
    func makeNoise() {
        print("Woof!")
    }
}

// 만약 우리가 Dog 클래스를 상속 받아서 Poodle 클래스를 만들었다면
// 이 때, makeNoise함수를 호출하면 어떻게 될까요?
// 마찬가지로 Woof를 출력하게 되겠죠??
class Poodle: Dog {
}

let poppy = Poodle()
poppy.makeNoise()

// 하지만, 우리는 다른 울음 소리를 출력하고 싶습니다.
// 우리는 쉽게 부모 클래스의 함수를 재정의해서 사용할 수 있습니다.

class Poodle: Dog {
    override func makeNoise() {
        print("Yip!")
    }
}

// override 키워드를 func 앞에 붙여주면 메서드를 재정의 할 수 있습니다.
```

<br>

### 4. Final 클래스 `Final classes`

우리가 만든 클래스는 Apple 플랫폼 전반에서 사용할 수가 있습니다.  
때로는, 다른 개발자가 자신의 클래스를 기반으로 빌드하지 못하도록 해야 하는 경우가 생깁니다.  
이 때, `final` 키워드를 이용해서 클래스를 선언하면, 다른 클래스에서 상속할 수 없습니다.

```swift
final class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
```

<br>

### 5. 객체 복사 `Copying objects`

클래스와 구조체의 세 번째 차이점은 복사 방법입니다.

`call by value`  
구조체를 복사 할 때 원본과 복사본은 서로 다릅니다.  
하나를 변경해도 다른 하나는 변경되지 않죠!

`call by reference`  
하지만, 클래스를 복사하면 원본과 복사본이 같은 것을 가리키므로,  
하나를 변경하면 다른 하나가 변경됩니다.

```swift
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)

// 첫 번째 출력과 두 번째 출력이 과연 같을까요?
// 아닙니다. 새롭게 만든 변수 singerCopy(singer의 복사본)역시
// 동일한 메모리를 가리키고 있기 때문에
// 값이 변경되어 버립니다.

// 출력결과
// Taylor Swift
// Justin Bieber
```

만약 Singer가 구조체라면 각각의 변수는 서로 다른 값을 나타내게 됩니다!

<br>

### 6. 소멸자 `Deinitializers`

클래스와 구조체의 네 번째 차이점은 클래스가 deinitializer를 가질 수 있다는 것입니다.  
클래스의 인스턴스가 파괴될 때 실행되는 코드인데요!  
코드로 함께 보시죠~

```swift
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }

    // 클래스의 가장 마지막 부분에 위치하도록 작성합니다.
    deinit {
        print("\(name) is no more!")
    }
}

// 반복문이 돌 때마다 Person 객체가 생성되고 파괴되고를 반복하기 때문에
// init(){}, deinit{}가 반복해서 호출됩니다.
for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// 출력결과
/*
John Doe is alive!
Hello, I'm John Doe
John Doe is no more!

John Doe is alive!
Hello, I'm John Doe
John Doe is no more!

John Doe is alive!
Hello, I'm John Doe
John Doe is no more!
*/
```

<br>

### 7. 가변성 `Mutability`

클래스와 구조체의 마지막 차이점은 상수를 처리하는 방식입니다.  
구조체의 경우 그 자체로 상수이기 때문에, 구조체 내부에 `var`를 이용해서 프로퍼티를 만든다고 해도  
그 값을 변경할 수 없습니다. 그렇기 때문에 우리는 `mutating`키워드를 이용했었죠!  
하지만, 클래스의 경우 클래스가 상수로써 만들어졌어도 `var` - 가변 프로퍼티의 값을 바꿀 수 있습니다.

```swift
class Singer {
    var name = "Taylor Swift"
}

// 클래스를 상수로 선언한다고 하더라도 값의 변경이 가능합니다.
let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)

// 값을 바꿀 수 없도록 하려면 프로퍼티를 상수로 선언해야합니다.
class Singer {
    let name = "Taylor Swift"
}
```
