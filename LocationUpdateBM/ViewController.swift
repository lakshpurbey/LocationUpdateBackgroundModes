//
//  ViewController.swift
//  LocationUpdateBM
//
//  Created by Laksh Purbey on 9/2/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate{
   
    private var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latLngLabel.frame = CGRect(x: 20, y: view.bounds.height / 2 - 50, width: view.bounds.width - 40, height: 100)
        view.addSubview(latLngLabel)
        
        getUserLocation()
    }
 
   func getUserLocation() {
    
    locationManager?.delegate = self

        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    
    locationManager?.allowsBackgroundLocationUpdates = true

    }

    private let latLngLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemFill
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
            print("location",location.coordinate.latitude)
            latLngLabel.text = "Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)"
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       print("\(error.localizedDescription)")
    }

   
}
