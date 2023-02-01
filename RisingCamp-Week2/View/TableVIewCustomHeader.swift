//
//  TableVIewCustomHeader.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/01.
//

import UIKit

class TableVIewCustomHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var seeAllLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sectionTitle.text = "123"
        sectionTitle.clipsToBounds = true
    }
}
