//
//  ViewController.swift
//  Milestone_Project_1to3
//
//  Created by taehy.k on 2021/04/20.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Variables
    var pictures: [String] = []

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "나라 리스트"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 이미지 로드
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("@3x.png") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
    
    // 셀 선택 시 행동
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        vc.modalPresentationStyle = .overFullScreen
        vc.country = pictures[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }

    // 셀 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // 셀 호출
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}


