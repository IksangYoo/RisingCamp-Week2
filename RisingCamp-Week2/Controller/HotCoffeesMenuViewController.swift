//
//  HotCoffeesMenuViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/02.
//

import UIKit

class HotCoffeesMenuViewController: UIViewController {
    @IBOutlet weak var sectionTitle: CustomLabel!
    
    enum drinksTypes {
        case americanos
        case brewedCoffees
        case cappucinos
        case espressoShots
        
        var title: String {
            switch self {
            case .americanos: return "Americanos"
            case .brewedCoffees: return "Brewed Coffees"
            case .cappucinos: return "Cappucinos"
            case .espressoShots: return "Espresso Shots"
            
            }
        }
        
        var name: [String] {
            switch self {
            case .americanos: return ["Caffe Americano"]
            case .brewedCoffees: return ["Veranda Blend","Caffe Misto","Dark Roast Coffee","Pike Place Roast","Decaf Pick Roast"]
            case .cappucinos: return ["Cappucinos"]
            case .espressoShots: return ["Espresso","Espresso"]
            }
        }
    }
    
    var type: drinksTypes = .americanos
    
    func updateType(_ type: drinksTypes) {
        self.type = type
    }
    
    func updateUI(){
        sectionTitle.text = type.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MenuVC")
    }
}

//MARK: - CollectionView Delegate & DataSource
extension HotCoffeesMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (type == .americanos){
            return type.name.count
        } else if (type == .brewedCoffees) {
            return type.name.count
        } else if (type == .cappucinos) {
            return type.name.count
        } else if (type == .espressoShots) {
            return type.name.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HotCoffeesCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = cell.contentView.backgroundColor;
        if (type == .americanos){
            cell.image.image = UIImage(named: "americano.png")
            cell.name.text = type.name[indexPath.row]
        } else if (type == .brewedCoffees) {
            cell.image.image = UIImage(named: "brewed.png")
            cell.name.text = type.name[indexPath.row]
        } else if (type == .cappucinos) {
            cell.image.image = UIImage(named: "cappuccino.png")
            cell.name.text = type.name[indexPath.row]
        } else if (type == .espressoShots) {
            cell.image.image = UIImage(named: "espresso.png")
            cell.name.text = type.name[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToCart", sender: nil)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 120, height: 160)
//    }
}

class HotCoffeesCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
}
