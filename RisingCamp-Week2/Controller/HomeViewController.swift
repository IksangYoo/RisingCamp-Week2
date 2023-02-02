//
//  ViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/01/30.
//
import Tabman
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!

    @IBOutlet weak var winterFeelsImage: CustomImageView!
    
    
    let maxTopViewHeight: CGFloat = 180
    let minTopViewHeight: CGFloat = 40
    
    override func viewDidLoad() {
        winterFeelsImage.layer.cornerRadius = 5
        winterFeelsImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        super.viewDidLoad()
    }
}

//MARK: - ScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //현재 스크롤의 위치 (최상단 = 0)
        let y = scrollView.contentOffset.y
        
        //변경될 최상단 뷰의 Height
        let modifiedTopViewHeight: CGFloat = topViewHeight.constant - y
        
        // *** 변경될 높이가 최댓값을 초과함
        if (modifiedTopViewHeight > maxTopViewHeight) {
            
            //현재 최상단뷰의 높이를 최댓값(250)으로 설정
            topViewHeight.constant = maxTopViewHeight
        } // *** 변경될 높이가 최솟값 미만임
        
        else if (modifiedTopViewHeight < minTopViewHeight) {
            //현재 최상단뷰의 높이를 최솟값(50+상태바높이)으로 설정
            topViewHeight.constant = minTopViewHeight
        }
        // *** 변경될 높이가 최솟값(50+상태바높이)과 최댓값(250) 사이임
        else {
            //현재 최상단 뷰 높이를 변경함
            topViewHeight.constant = modifiedTopViewHeight
            scrollView.contentOffset.y = 0
        }
        
        // 상단뷰 크기가 변경되면 레이블 숨김
        if ( modifiedTopViewHeight > 150) {
            welcomeLabel.isHidden = false
        } else {
            welcomeLabel.isHidden = true
        }
    }
    
}
