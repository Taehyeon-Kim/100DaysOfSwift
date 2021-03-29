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
        
        print(pictures)
    }
    
    // MARK: - Table View Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}

