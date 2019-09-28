//
//  ViewControllerMap.swift
//  trace_LocationGPS
//
//  Created by mohamed hashem on 9/26/19.
//  Copyright © 2019 mohamed hashem. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewControllerMap: UIViewController {

    @IBOutlet weak var BeginLocation: UIButton!
    @IBOutlet weak var mapTraced: MKMapView!
    
    var locationManger = CLLocationManager()
    var regoin = MKCoordinateRegion()
    var startLocationTrace = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.allowsBackgroundLocationUpdates = true
        locationManger.startUpdatingLocation()
        
        BeginLocation.setTitle("Start Trace", for: .normal)
        BeginLocation.layer.cornerRadius = 6
        
        self.title = "Trace Map"
    }
    
    private func setupMap(Coordinat: CLLocationCoordinate2D, numberAnnoteation: Int) {
        regoin.center = Coordinat
        regoin.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        mapTraced.setRegion(regoin, animated: true)
        mapTraced.showsUserLocation = true
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = Coordinat
        
        mapTraced.addAnnotation(annotation)
        
    }
    
    @IBAction func pressToStartAndStopTrace(_ sender: UIButton) {
//        startLocationTrace = !startLocationTrace
//
//        if startLocationTrace {
//            locationManger.startUpdatingLocation()
//            BeginLocation.setTitle("Stop Trace", for: .normal)
//        } else {
//            locationManger.stopUpdatingLocation()
//            BeginLocation.setTitle("Start Trace", for: .normal)
//        }
    }
    
}

extension ViewControllerMap: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let coordinate = locations.last?.coordinate else {
            return
        }
        
        if UIApplication.shared.applicationState == .active {
            setupMap(Coordinat: coordinate, numberAnnoteation: locations.count)
        } else {
            print("locations.last?.coordinate")
        }
        
        setupMap(Coordinat: coordinate, numberAnnoteation: locations.count)
    }
}
