//
//  PopUpViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/03.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var offerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //shadow 적용하기 위한 containerView
        let containerView = UIView()
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 4)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 1
        containerView.addSubview(offerView)

        // offerView 모서리 둥글게 만들기
        offerView.layer.cornerRadius = 25
        offerView.clipsToBounds = true
        view.addSubview(containerView)

        offerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        offerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        // containerView 에 대해 Auto Layout 설정
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 315).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 367).isActive = true
    }
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

