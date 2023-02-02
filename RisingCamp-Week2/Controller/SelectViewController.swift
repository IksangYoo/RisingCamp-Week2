//
//  SelectViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/02.
//

import UIKit

class SelectViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = image.frame.height/2
    }
    
    @IBAction func addToOrderPressed(_ sender: UIButton) {
        print("H")
    }
    

}
