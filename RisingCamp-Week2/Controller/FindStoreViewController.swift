//
//  FindStoreViewController.swift
//  RisingCamp-Week2
//
//  Created by Iksang Yoo on 2023/02/03.
//
import CoreLocation
import MapKit
import UIKit

protocol FindStoreDelegate: AnyObject {
    func pass(_ store: Store)
}

class FindStoreViewController: UIViewController {
    
    @IBOutlet weak var adressLabel: CustomLabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var storeView: UIView!
    var store : Store?
    weak var delegate: FindStoreDelegate?
    
    let mark = Marker(coordinate:  CLLocationCoordinate2D(latitude: 37.55769, longitude: 126.92450))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(.follow, animated: true)
        mapView.addAnnotation(mark)
        
       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        storeView.addGestureRecognizer(tapGesture)
    }
    
        @objc func handleTap(sender: UITapGestureRecognizer) {
            store = Store(address: adressLabel.text!)
            print("store Adress: \(adressLabel.text!)")
            delegate?.pass(store!)
            dismiss(animated: true)
        }

}
class Marker: NSObject, MKAnnotation {
  let coordinate: CLLocationCoordinate2D

  init(
    coordinate: CLLocationCoordinate2D
  ) {
    self.coordinate = coordinate

    super.init()
  }

}
