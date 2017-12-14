//
//  ViewController.swift
//  beaconColor
//
//  Created by Ş on 3.12.2017.
//  Copyright © 2017 Ş. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var LocationManager:CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       LocationManager.delegate = self
        LocationManager.requestAlwaysAuthorization()
        LocationManager.requestWhenInUseAuthorization()
            }
    
    func rangeBeacons() {
        
        let uuid = UUID(uuidString: "B8212268-766E-41D5-C25D-241CEFF27650")!
        let id = "WGX_iBeacon"
        
        let region = CLBeaconRegion(proximityUUID: uuid, identifier: id)
        
        LocationManager.startRangingBeacons(in: region)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            
        }
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        guard let discoveredBeaconProximity = beacons.first?.proximity else { print("bulunamadı");  return }
        
        let backgroundColor:UIColor = {
            
            switch discoveredBeaconProximity {
            case .immediate: return UIColor.green
            case .near: return UIColor.orange
            case .far: return UIColor.red
            case .unknown: return UIColor.black

            }
            
        }()
        
        view.backgroundColor = backgroundColor
    }
}













