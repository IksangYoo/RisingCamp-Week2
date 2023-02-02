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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = .darkGray
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
}
