# Day 15 - 스위프트 복습(3)

## 주제

1. 프로퍼티 (Properties)

2. 정적 프로퍼티와 메서드 (Static properties and methods)

3. 접근 제어 (Access control)

4. 다형성과 타입캐스팅 (Polymorphism and typecasting)

5. 클로저 (Closures)

---

<br>

### 1. 프로퍼티

```markdown
1. 프로퍼티
   구조체와 클래스는 자체로 변수와 상수를 가질 수 있습니다.
   우리는 이를 프로퍼티라고 부릅니다.
   간단하게 구조체와 클래스가 가지는 변수 또는 상수가 프로퍼티인거죠!
```

```markdown
2. 프로퍼티 옵저버 (property observer)
   willSet과 didSet이 존재합니다.
   프로퍼티가 변경되려고하거나 변경될때 실행할 코드를 적을 수 있는데요.
   예를 들어, 값이 변경 될 때 UI를 업데이트할 수 있습니다.
```

```swift
// 현재는 willSet과 didSet부분에 updateUI()함수를 이용해서
// 단순출력을 하고 있는데, 출력 대신 UI부분을 직접 건드리는 코드를 만들 수도 있겠죠?
struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }

        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "T-shirts")
taylor.clothes = "short skirts"
```

```markdown
3. 연산 프로퍼티
   값을 저장하는 프로퍼티가 아닌 말 그대로 연산 역할을 수행하는 프로퍼티입니다.
   아래 코드에서 보시면 ageInDogYears가 연산 프로퍼티인데요!
   어떠한 특정 값이 저장되어 있지 않고 연산의 역할을 수행하고 있죠!
   set {} 또는 get {}을 이용해서 다른 프로퍼티와의 소통을 합니다.
   (😁 소통 참 중요하죠! 아무말 죄송합니다..ㅎㅎ)

   자세한 이야기는 [Zedd님 블로그](https://zeddios.tistory.com/245)에 너무 잘 정리되어 있어서 참고 하시면 좋을 것 같습니다!!
```

```swift
struct Person {
    var age: Int

    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
}

var fan = Person(age: 25)
print(fan.ageInDogYears)
```

<br>

### 2. 정적 프로퍼티와 메서드

```
static이라는 키워드를 이용하면 공유할 수 있는 프로퍼티와 메서드를 만들 수 있습니다. 자주 사용할 친구인데요..! 저도 최근에 사이드 프로젝트를 하면서 많이 사용했었습니다. 여러 클래스 파일에서 공유할 수 있는 값이 필요한 경우가 있는데요! 그때 사용하시면 됩니다. 이 부분은 직접 사용해봐야 감이 올 것 같은데요! 우선 간단하게 사용하는 방법만 알아보도록 하겠습니다.
```

```swift
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"

    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)
```

<br>

### 3. 액세스 제어

```
다음은 swift의 접근 제어 부분입니다.
솔직히 이부분 이해하기는 쉬운데 적절히 사용하는 것이 가장 어려운 것 같아요.
언제 어떤 것을 사용해야하는지 정확한 가이드라인이 없다보니 어렵네요..
많이 코드를 작성해보는 것이 정답일 것 같습니다.
```

아래에 보이는 5가지 접근지정자를 통해서 프로퍼티, 메서드, 클래스 등등의 접근 권한을 정해줄 수 있습니다.

- open (가장 개방적)
- public
- internal
- fileprivate
- private (가장 제한적)

💁🏻 [Zedd님 블로그](https://zeddios.tistory.com/383)를 참고합시다 :)

<br>

### 4. 다형성과 타입캐스팅

```markdown
1. 다형성
   객체지향 프로그래밍의 다형성은 주로 오버라이딩과 오버로딩을 의미한다고 합니다.
```

```swift
// 아래 코드는 Album이라는 클래스를 상속받아서
// 새롭게 프로퍼티나 메서드를 추가하거나
// 부모 클래스(Album)의 메서드를 오버라이딩해서 사용하고 있습니다.(다형성)

class Album {
    var name: String

    init(name: String) {
        self.name = name
    }

    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}
```

```markdown
2. 타입캐스팅
   타입캐스팅은 인스턴스의 타입을 확인하거나, 인스턴스의 타입을 슈퍼클래스 또는 서브클래스 타입처럼 다루기 위해 이용합니다.

   'is' 또는 'as' 키워드를 이용해서 타입 캐스팅을 할 수 있습니다.
   타입 캐스팅을 단순하게 생각해보면 다른 타입으로 형변환 하는 것이라고 생각하면 좋을 것 같습니다.

   레퍼런스: [Zedd님 블로그](https://zeddios.tistory.com/265)
```

```swift
// 선택적으로 다운 캐스팅을 하면서
// album이라는 객체가 StudioAlbum인지, LiveAlbum인지 체크하면서
// 각각의 코드를 실행하고 있습니다.

for album in allAlbums {
    print(album.getPerformance())

    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}
```

<br>

### 5. 클로저

지난 글에 자세히 정리해놨기 때문에 넘어가도록 하겠습니다~  
나중에 보았을때는 정복한 상태이길🔥

- [클로저(1)](https://github.com/Taehyeon-Kim/100DaysOfSwift/blob/master/day6.md)
- [클로저(2)](https://github.com/Taehyeon-Kim/100DaysOfSwift/blob/master/day7.md)
