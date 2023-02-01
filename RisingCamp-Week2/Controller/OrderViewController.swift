//
//  OrderViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/01.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let sectionTitle = ["Drinks","Food","At Home Coffee","Merchandise","Gift Cards"]
    let sectionSeeAll = ["See all 197","See all 92","See all 22","See all 13","See all 3"]
    let drinks = ["Hot Coffees","Hot Teas","Hot Drinks","Frappuccino","Cold Coffees","Iced Teas","Cold Drinks"]
    let food = ["Hot Breakfast","Bakery","Lunch","Snacks & Sweets","Oatmeal & Yogurt"]
    
    var topbarHeight: CGFloat {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        //펜 액션
        let panGestureRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_ :)))
        
        panGestureRecongnizer.delegate = self
        
        self.view.addGestureRecognizer(panGestureRecongnizer)
        
        let nibName = UINib(nibName: "OrderTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "cell")
        
        let headerNib = UINib(nibName: "TableVIewCustomHeader", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "TableVIewCustomHeader")
    }
    
}


//MARK: - TableViewDelegate, TableViewDataSource
extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return drinks.count
        } else if section == 1 {
            return food.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? OrderTableViewCell else {
             return UITableViewCell()
         }
        if indexPath.section == 0 {
            cell.menuName.text = "\(drinks[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.menuName.text = "\(food[indexPath.row])"
        } else {
            return UITableViewCell()
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sectionTitle[section]
//    }
//
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableVIewCustomHeader") as! TableVIewCustomHeader

        header.sectionTitle.text = sectionTitle[section]
        return header
    }
}

//MARK: - UIGestureRecognizerDelegate
extension OrderViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        
        return true
        
    }

    @objc func panAction (_ sender : UIPanGestureRecognizer){

            let velocity = sender.velocity(in: tableView)
        
        if abs(velocity.y) > abs(velocity.x) {
            if (velocity.y < 0 ){
                navigationItem.largeTitleDisplayMode = .always
            } else {
                navigationItem.largeTitleDisplayMode = .never
            }
            
        }
        
    }

}
