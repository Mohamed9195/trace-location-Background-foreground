//
//  ViewController.swift
//  trace_LocationGPS
//
//  Created by mohamed hashem on 9/26/19.
//  Copyright © 2019 mohamed hashem. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableLocation: UITableView!
    
    var locationCoordinate: String?
    var locationSpeed: String?
    var locationAccuracy: String?
    
    var numberOfTableCell = 1
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        
        tableLocation.separatorStyle = .none
    }


}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfTableCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LocationCell
        cell.setSelected(true, animated: true)
        
        if locationCoordinate != nil, locationAccuracy != nil, locationSpeed != nil {
            cell.locationSpeed.text = locationSpeed
            cell.locationAccuracy.text = locationAccuracy
            cell.locationCoordinate.text = locationCoordinate
        }
        
        return cell
        
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationCoordinate =  String(locations.last?.coordinate.latitude.description ?? " " ) + "/" + String(locations.last?.coordinate.longitude.description ?? " " )
        locationAccuracy = String(locations.last?.verticalAccuracy.description ?? " ")
        locationSpeed = String(locations.last?.speed.description ?? " ")
        
        numberOfTableCell += 1
        self.tableLocation.reloadData()
    }
}
