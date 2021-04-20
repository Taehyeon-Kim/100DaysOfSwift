//
//  DetailViewController.swift
//  Milestone_Project_1to3
//
//  Created by taehy.k on 2021/04/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Variables
    var country: String?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black

        // 국가가 존재하면 이미지 호출
        if let country = self.country {
            self.imageView.image = UIImage(named: country)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc func shareTapped() {
        print("Share Button Tapped")
    }

}
