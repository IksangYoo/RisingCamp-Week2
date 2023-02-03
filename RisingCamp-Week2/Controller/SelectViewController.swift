//
//  SelectViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/02.
//

import UIKit

class SelectViewController: UIViewController {
    
    @IBOutlet weak var shortButton: UIButton!
    @IBOutlet weak var tallButton: UIButton!
    @IBOutlet weak var grandeButton: UIButton!
    @IBOutlet weak var ventiButton: UIButton!
    @IBOutlet weak var caloriesLabel: CustomLabel!
    @IBOutlet weak var bagButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    let sizes = ["short","tall","grande","venti"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = image.frame.height/2
    }
    
    @IBAction func addToOrderPressed(_ sender: UIButton) {
        bagButton.setImage(UIImage(named: "cart1"), for: .normal)
    }
    
    @IBAction func sizeButtonPressed(_ sender: UIButton) {
        changeSizeButtonChage(sender)
        
    }
    
    func changeSizeButtonChage(_ sender: UIButton) {
        if (sender.currentTitle == sizes[0]) {
            sender.setImage(UIImage(named: sizes[0]+"2"), for: .normal)
            tallButton.setImage(UIImage(named: sizes[1]), for: .normal)
            grandeButton.setImage(UIImage(named: sizes[2]), for: .normal)
            ventiButton.setImage(UIImage(named: sizes[3]), for: .normal)
            caloriesLabel.text = "5 calories"
        }
        else if (sender.currentTitle == sizes[1]) {
            sender.setImage(UIImage(named: sizes[1]+"2"), for: .normal)
            shortButton.setImage(UIImage(named: sizes[0]), for: .normal)
            grandeButton.setImage(UIImage(named: sizes[2]), for: .normal)
            ventiButton.setImage(UIImage(named: sizes[3]), for: .normal)
            caloriesLabel.text = "10 calories"
        }
        else if (sender.currentTitle == sizes[2]) {
            sender.setImage(UIImage(named: sizes[2]+"2"), for: .normal)
            tallButton.setImage(UIImage(named: sizes[1]), for: .normal)
            shortButton.setImage(UIImage(named: sizes[0]), for: .normal)
            ventiButton.setImage(UIImage(named: sizes[3]), for: .normal)
            caloriesLabel.text = "15 calories"
        }
        else if  (sender.currentTitle == sizes[3]) {
            sender.setImage(UIImage(named: sizes[3]+"2"), for: .normal)
            tallButton.setImage(UIImage(named: sizes[1]), for: .normal)
            grandeButton.setImage(UIImage(named: sizes[2]), for: .normal)
            shortButton.setImage(UIImage(named: sizes[0]), for: .normal)
            caloriesLabel.text = "20 calories"
        }
    }

}
