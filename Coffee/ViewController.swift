//
//  ViewController.swift
//  Coffee
//
//  Created by andy on 4/1/16.
//  Copyright © 2016 andy. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView?
    var locationManager:CLLocationManager?
    let distanceSpan:Double = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let mapView = self.mapView
        {
            mapView.delegate = self
        }
    }
    override func viewDidAppear(animated: Bool)
    {
        if locationManager == nil {
            locationManager = CLLocationManager()
            
            locationManager!.delegate = self
            locationManager!.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager!.requestAlwaysAuthorization()
            locationManager!.distanceFilter = 50 // Don't send location updates with a distance smaller than 50 meters between them
            locationManager!.startUpdatingLocation()
        }
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let mapView = self.mapView {
            let location = locations.last!

            let region = MKCoordinateRegionMakeWithDistance(location.coordinate, distanceSpan, distanceSpan)
            mapView.setRegion(region, animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

