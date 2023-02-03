//
//  ReviewOrderViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/03.
//

import UIKit



class ReviewOrderViewController: UIViewController {
    
    var coffees = [Coffee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension ReviewOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? orderCell else { return UITableViewCell()}
        cell.nameLabel.text = coffees[indexPath.row].name
        cell.sizeLabel.text = coffees[indexPath.row].size
        cell.caloriesLabel.text = coffees[indexPath.row].calories
        
        return cell
    }
    
    
}

class orderCell: UITableViewCell {
    var coffee : Coffee?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var drinkImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
}
