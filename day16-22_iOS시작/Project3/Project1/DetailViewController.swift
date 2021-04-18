//
//  DetailViewController.swift
//  Project1
//
//  Created by taehy.k on 2021/03/30.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 둘다 optional이기 때문에 따로 처리안해도 됨 - 그냥 대입
        title = selectedImage
        // Large 타이틀 모드 없애기
        navigationItem.largeTitleDisplayMode = .never
        // 네비게이션 아이템 색상 변경 (tint color)
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(shareTapped))
        
        // 넘어온 값이 nil이 아니라면 이미지를 세팅해준다.
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Tap 시 네비게이션 바 숨기기 - O
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Tap 시 네비게이션 바 숨기기 - X
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        guard let text = self.selectedImage else {
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, text], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
}
