//
//  MapViewController.swift
//  Surveyor
//
//  Created by Louis Cheung on 9/23/14.
//  Copyright (c) 2014 Louis Cheung. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!

    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()

        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = MKUserTrackingMode.Follow
    }

// ----------------------------------------------------------------------------------- MARK: - CLLocationManagerDelegate

}
