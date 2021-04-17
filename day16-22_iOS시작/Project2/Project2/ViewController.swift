//
//  ViewController.swift
//  Project2
//
//  Created by taehy.k on 2021/04/01.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0 // 정답을 저장할 변수
    var count = 0 // 몇문제 풀었는지 체크할 변수
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "🌍 국기 알아맞추기"
        
        // 배열도 문자열처럼 덧셈기호를 이용해서 원소를 추가할 수 있다.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // Core Animation 타입인 CALayer 사용
        // 테두리가 CALayer에 속하기 때문에 UIColor로만 반환하면 값을 사용할 수가 없다.
        // 따라서, 뒤에 cgColor를 붙여준다.
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        // 함수 호출
        askQuestion()
    }
    
    // viewDidLoad()에서는 처음에 매개변수를 전달하지 않기 때문에 nil을 전달
    func askQuestion(action: UIAlertAction! = nil) {
        // 배열의 원소들을 무작위로 섞는 메서드
        countries.shuffle()
        // 0 ~ 2까지의 난수 생성
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // 제목에 정답을 표시하는데, 대문자로 표시
        title = "맞출 나라: \(countries[correctAnswer].uppercased()) / 점수: \(score)"
        
//        countryLabel.text = countries[correctAnswer].uppercased()
    }

    // 3개의 버튼이 모두 동일한 메서드를 호출하고 있는 것이 중요하다.
    // 각각을 다 다르게 IBAction으로 연결하면 불필요한 코드 낭비이다.
    // 그럼 어떤 버튼이 눌렸는지 어떻게 알까?
    // 뷰에는 특별한 식별 번호가 있다 → 바로 tag
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        // 정답이 맞는지 체크
        // 점수 증감
        if sender.tag == correctAnswer {
            title = "정답"
            message = "정답입니다."
            score += 1
        } else {
            title = "오답"
            message = "틀렸습니다. 그것은 \(countries[sender.tag]) 국기입니다."
            score -= 1
        }
        
        count += 1
        
        if count == 10 {
            title = "최종 점수"
            message = "당신의 점수는 \(score)점 입니다."
            count = 0
        }
        

        // 메시지 출력
        // UIAlertController 사용
        // - 클로저 사용: 클로저는 변수처럼 사용할 수 있는 특별한 종류의 코드 블럭
        // - 코드 블록의 복사본을 가져 와서 나중에 호출 가능
        // - AlertController 생성
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // - AlertAction 연결
        ac.addAction(UIAlertAction(title: "Continue",
                                   style: .default,
                                   handler: askQuestion))
        // - Alert 호출
        present(ac, animated: true)
    }
    
}

