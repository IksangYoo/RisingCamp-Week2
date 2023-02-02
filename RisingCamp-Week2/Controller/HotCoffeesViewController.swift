//
//  HotCoffeesViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/02.
//

import UIKit

class HotCoffeesViewController: UIViewController {
    var americanosVC: HotCoffeesMenuViewController!
    var brewedCoffeesVC: HotCoffeesMenuViewController!
    var cappucinosVC: HotCoffeesMenuViewController!
    var espressoShotsVC: HotCoffeesMenuViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "americanos" {
            let destinationVC = segue.destination as? HotCoffeesMenuViewController
            americanosVC = destinationVC
            americanosVC.updateType(.americanos)
            
        } else if segue.identifier == "brewedCoffees" {
            let destinationVC = segue.destination as? HotCoffeesMenuViewController
            brewedCoffeesVC = destinationVC
            brewedCoffeesVC.updateType(.brewedCoffees)
            
        } else if segue.identifier == "cappucinos" {
            let destinationVC = segue.destination as? HotCoffeesMenuViewController
            cappucinosVC = destinationVC
            cappucinosVC.updateType(.cappucinos)
            
        } else if segue.identifier == "espressoShots"{
            let destinationVC = segue.destination as? HotCoffeesMenuViewController
            espressoShotsVC = destinationVC
            espressoShotsVC.updateType(.espressoShots)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = .darkGray
    }
    
}
