//
//  OrderTableViewCell.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/01.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImageView: CustomImageView!
    @IBOutlet weak var menuName: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        menuImageView.makeCircular()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        // 테이블 뷰 셀 사이의 간격
        super.layoutSubviews()
        menuImageView.makeCircular()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0))
        
    }
}
