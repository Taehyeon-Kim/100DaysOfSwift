# Day 9 - 구조체(2)

Structs, part two  
`initializers`, `access control`, `static properties`, `laziness`

## 목차

1. 이니셜라이저  
   `Initializers`

2. 현재 인스턴스 참조 (`self`)  
   `Referring to the current instance`

3. Lazy 프로퍼티  
   `Lazy properties`

4. 정적 프로퍼티와 메서드  
   `Static properties and methods`

5. 액세스 제어  
   `Access control`

---

<br>

### 1. 이니셜라이저 (Initializers)

이니셜라이저는 구조체를 만들 때 제공하는 특별한 메서드입니다.  
`init()`라는 함수로 제공이 됩니다.  
구조체를 만들면서 초기화를 할 수가 있도록 도와주는 것인데요.

▶︎ 원래라면 아래처럼 구조체를 선언하고 인스턴스를 생성할 때에  
프로퍼티에 넣어줄 값을 같이 전달해주어야 하는데요.

```swift
struct User {
    var username: String
}

var user = User(username: "twostraws")
```

▶︎ 다음과 같이 구조체 내부에 초기화를 해주면, 매개변수를 넘겨주지 않고 인스턴스를 만들 수 있습니다! 👻

```swift
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"
```

<br>

### 2. 현재 인스턴스 참조 (`self`)

메서드 내에서는 `self`라는 특수 상수를 얻게 됩니다.  
`self`는 현재 사용중인 구조체 인스턴스를 가리킵니다.  
프로퍼티와 동일한 매개변수 이름을 가진 이니셜라이저를 만들 때 유용한데요.

```swift
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")

        // 다음처럼 동일한 이름을 사용하려고 할 때
        // 프로퍼티와 매개변수를 구분할 수 있도록 도와줍니다.
        self.name = name
    }
}

// self.name이 구조체 내부의 프로퍼티겠죠?
```

<br>

### 3. Lazy 프로퍼티 (`lazy`)

lazy 프로퍼티는 인스턴스가 초기화 되는 시점이 아니라 프로퍼티에 접근하는 시점에 초기화됩니다.  
이 말인 즉슨, 프로퍼티에 접근하지 않는다면 메모리에 올라가지도 않는다는 거겠죠?  
사용하지 않을 때는 생성하지 않겠다는 것입니다!

```swift
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")

// 원래라면
// Creating family tree!라는 문장이 출력되어야 합니다.

// 하지만, lazy라는 키워드를 사용했기 때문에
// 프로퍼티에 접근하기 전까지는 실행되지 않습니다.

// 이렇게 되면, print()문이 실행됩니다!!!
ed.familyTree
```

<br>

### 4. 정적 프로퍼티와 메서드 (Static properties and methods)

조금 쉽게 생각을 해보겠습니다.  
`static` 키워드를 사용하면 공유되는 프로퍼티나 메서드를 생성할 수가 있습니다.  
무슨 말이냐구요? 코드로 바로 가시죠. 바로 이해가 되실 겁니다!

```swift
// 학생 구조체를 선언했습니다.
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

// 구조체를 이용해서 학생을 2명 만들었네요.
let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

// 갑자기, 우리는 학생이 몇 명 만들어졌는지 궁금해졌어요!
// 이 때, 구조체 내에 static 키워드를 이용해서 공유 변수를 만들었기 때문에
// 구조체를 이용해서 인스턴스가 생성될 때 마다
// classSize라는 변수가 1씩 증가할 것입니다.

// Student.classSize로 접근도 가능하답니다.

// 출력결과
// 2
print(Student.classSize)
```

<br>

### 5. 액세스 제어 (Access control)

액세스 제어를 하게 되면 프로퍼티와 메서드에 접근 권한을 제어할 수 있습니다.  
`private` 키워드를 이용하면 접근을 막을 수 있는데요.

```swift
struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }
}

let ed = Person(id: "12345")
```

```swift
사람의 고유 아이디를 비공개로 하고 싶기 때문에 `private`키워드를 붙였습니다.
그렇기 때문에, ed.id 이렇게 접근이 불가능합니다.
```

```swift
struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }

    // 다음과 같이 오로지 내부 메서드에서만 접근이 가능합니다.
    func identify() -> String {
        return "My social security number is \(id)"
    }
}
```

이와 비슷하게 다른 모든 코드에서 프로퍼티와 메서드를 사용하고 싶다면,  
`public`키워드를 이용할 수 있습니다.  
클래스(Class)에서도 동일하게 적용된답니다!
