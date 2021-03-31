//
//  ViewController.swift
//  Project1
//
//  Created by taehy.k on 2021/03/29.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Variables
    var pictures = [String]()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 타이틀 설정
        title = "Storm Viewer"
        // Large 타이틀 설정
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 파일매니저를 사용하기 위한 싱글톤 인스턴스.
        let fm = FileManager.default
        
        // 앱에 추가한 모든 리소스에 대한 경로를 알려주세요.
        let path = Bundle.main.resourcePath!
        
        // contentsOfDirectory(atPath:) 메소드는 설정한 경로의 디렉토리 안에 있는 파일들을 [String] 형태로 반환
        let items = try! fm.contentsOfDirectory(atPath: path)

        // 현재 contents/ 디렉터리 안에 있는 item들이 배열로 만들어져 있음
        // nssl을 포함하는 파일들을 체크해서 pictures 배열에 추가
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        // 이름 순대로 정렬하기 (Challenge 2 - 테이블뷰 정렬하기)
        // pictures.sort()
    }
    
    // MARK: - Table View Methods
    
    // 행 수 설정하기
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // 셀 가져오기
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    // 셀 클릭 시
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // UIViewController는 기본적으로 storyboard와 navigationController라는 프로퍼티를 가진다.
        
        // DetailViewController가 정상적으로 불러와졌다면
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            
            // 행에 맞는 이미지이름을 넘겨준다.
            vc.selectedImage = pictures[indexPath.row]
            
            // 세부 제목 표시줄에 다음과 같이 나타내려고 → ex. Picture 2 of 10
            // vc.title = "Picture \(indexPath.row + 1) of \(pictures.count)"
            
            // 네비게이션 컨트롤러에 push한다.
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
}

