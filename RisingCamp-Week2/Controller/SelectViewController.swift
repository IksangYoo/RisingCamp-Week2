//
//  SelectViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/02.
//

import UIKit

class SelectViewController: UIViewController,FindStoreDelegate {
    func pass(_ store: Store) {
        func pass(_ store: Store) {
            self.store = store
        }
    }
    
    
    @IBOutlet weak var shortButton: UIButton!
    @IBOutlet weak var tallButton: UIButton!
    @IBOutlet weak var grandeButton: UIButton!
    @IBOutlet weak var ventiButton: UIButton!
    @IBOutlet weak var caloriesLabel: CustomLabel!
    @IBOutlet weak var bagButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    var sizeTitle = "Short"
    let sizes = ["short","tall","grande","venti"]
    var coffees = [Coffee]()
    var store : Store?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = image.frame.height/2
    }
    
    @IBAction func addToOrderPressed(_ sender: UIButton) {
        coffees.append(Coffee(name: "Caffe Americano", size: sizeTitle, calories: caloriesLabel.text!))
        if (coffees.count < 4) {
            bagButton.setImage(UIImage(named: "cart\(coffees.count)"), for: .normal)
        }
    }
    
    @IBAction func sizeButtonPressed(_ sender: UIButton) {
        changeSizeButtonChage(sender)
        
    }
    @IBAction func bagButtonPressed(_ sender: Any) {
        let findStoreVC = storyboard?.instantiateViewController(withIdentifier: "findStoreVC") as! FindStoreViewController
        findStoreVC.delegate = self
        guard let reviewVC = self.storyboard?.instantiateViewController(identifier: "reviewOrderVC") as? ReviewOrderViewController else { return }
        reviewVC.coffees = coffees
        reviewVC.store = store
        present(reviewVC, animated: true)
    }
    
    func changeSizeButtonChage(_ sender: UIButton) {
        if (sender.currentTitle == sizes[0]) {
            sender.setImage(UIImage(named: sizes[0]+"2"), for: .normal)
            tallButton.setImage(UIImage(named: sizes[1]), for: .normal)
            grandeButton.setImage(UIImage(named: sizes[2]), for: .normal)
            ventiButton.setImage(UIImage(named: sizes[3]), for: .normal)
            sizeTitle = "Short"
            caloriesLabel.text = "5 calories"
        }
        else if (sender.currentTitle == sizes[1]) {
            sender.setImage(UIImage(named: sizes[1]+"2"), for: .normal)
            shortButton.setImage(UIImage(named: sizes[0]), for: .normal)
            grandeButton.setImage(UIImage(named: sizes[2]), for: .normal)
            ventiButton.setImage(UIImage(named: sizes[3]), for: .normal)
            sizeTitle = "Tall"
            caloriesLabel.text = "10 calories"
        }
        else if (sender.currentTitle == sizes[2]) {
            sender.setImage(UIImage(named: sizes[2]+"2"), for: .normal)
            tallButton.setImage(UIImage(named: sizes[1]), for: .normal)
            shortButton.setImage(UIImage(named: sizes[0]), for: .normal)
            ventiButton.setImage(UIImage(named: sizes[3]), for: .normal)
            sizeTitle = "Grande"
            caloriesLabel.text = "15 calories"
        }
        else if  (sender.currentTitle == sizes[3]) {
            sender.setImage(UIImage(named: sizes[3]+"2"), for: .normal)
            tallButton.setImage(UIImage(named: sizes[1]), for: .normal)
            grandeButton.setImage(UIImage(named: sizes[2]), for: .normal)
            shortButton.setImage(UIImage(named: sizes[0]), for: .normal)
            sizeTitle = "Venti"
            caloriesLabel.text = "20 calories"
        }
    }

}
