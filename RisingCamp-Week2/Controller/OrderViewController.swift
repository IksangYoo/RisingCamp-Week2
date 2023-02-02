//
//  OrderViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/01.
//

import UIKit

class OrderViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    private var shadowImageView: UIImageView?
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.521427691, blue: 0.2605894804, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 움직일 underLineView의 leadingAnchor 따로 작성
    private lazy var leadingDistance: NSLayoutConstraint = {
        return underLineView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
    }()
    
    let sectionTitle = ["Drinks","Food","At Home Coffee","Merchandise","Gift Cards"]
    let sectionSeeAll = ["See all 197","See all 92","See all 22","See all 13","See all 3"]
    let drinks = ["Hot Coffees","Hot Teas","Hot Drinks","Frappuccino","Cold Coffees","Iced Teas","Cold Drinks"]
    let food = ["Hot Breakfast","Bakery","Lunch","Snacks & Sweets","Oatmeal & Yogurt"]

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if shadowImageView == nil {
            shadowImageView = findShadowImage(under: navigationController!.navigationBar)
        }
        shadowImageView?.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        shadowImageView?.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Underline 오토레이아웃
        self.tableView.backgroundColor = #colorLiteral(red: 0.9686275125, green: 0.9686275125, blue: 0.9686275125, alpha: 1)
        view.addSubview(underLineView)
        NSLayoutConstraint.activate([
            underLineView.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            underLineView.heightAnchor.constraint(equalToConstant: 3),
            leadingDistance,
            underLineView.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments))
        ])
        //펜 액션
        let panGestureRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_ :)))

        panGestureRecongnizer.delegate = self
        
        self.view.addGestureRecognizer(panGestureRecongnizer)
        
//        //removing border
//        let navigationBar = navigationController?.navigationBar
//        let navigationBarAppearance = UINavigationBarAppearance()
//        navigationBarAppearance.shadowColor = .clear
//        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
        

        segmentedControlUI()
        
        let nibName = UINib(nibName: "OrderTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "cell")
        
        let headerNib = UINib(nibName: "TableVIewCustomHeader", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "TableVIewCustomHeader")
    }
    
    @IBAction func pressSegmentedControl(_ sender: UISegmentedControl) {
        changeUnderlinePosition()
    }
    
    func changeUnderlinePosition() {
        let segmentIndex = CGFloat(segmentedControl.selectedSegmentIndex)
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.leadingDistance.constant = leadingDistance
            self?.view.layoutIfNeeded()
        })
    }
    
    
    func segmentedControlUI() {
        // 배경 색 제거
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        // Segment 구분 라인 제거
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        // 선택 되어 있지 않을때 폰트 및 폰트컬러
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.darkGray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)
        ], for: .normal)
        
        // 선택 되었을때 폰트 및 폰트컬러
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)
        ], for: .selected)
    }
    
    private func findShadowImage(under view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1 {
            return (view as! UIImageView)
        }

        for subview in view.subviews {
            if let imageView = findShadowImage(under: subview) {
                return imageView
            }
        }
        return nil
    }
    
}


//MARK: - TableViewDelegate, TableViewDataSource
extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Section별 row갯수 설정
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
            cell.menuImageView.image = UIImage(named: "\(indexPath.row).png")
            cell.menuName.text = "\(drinks[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.menuImageView.image = UIImage(named: "Home3.png")
            cell.menuName.text = "\(food[indexPath.row])"
        } else {
            return UITableViewCell()
        }
        cell.backgroundColor = cell.contentView.backgroundColor;
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            self.performSegue(withIdentifier: "goTo\(drinks[indexPath.row])", sender: nil)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableVIewCustomHeader") as! TableVIewCustomHeader

        header.sectionTitle.text = sectionTitle[section]
        header.seeAllLabel.text = sectionSeeAll[section]
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
                navigationItem.largeTitleDisplayMode = .never
            } else {
                navigationItem.largeTitleDisplayMode = .always
            }

        }
    }
}
