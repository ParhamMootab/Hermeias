//
//  ViewController.swift
//  MapStory
//
//  Created by Parham Shagerdmootab on 2022-10-17.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GMSServices.provideAPIKey("AIzaSyAljGQx6PV8wK63qHQXjl5FJ3UZDeXta2Y")
        let camera = GMSCameraPosition(latitude: 49.28273, longitude: -123.120735, zoom: 12)
        let mapView = GMSMapView(frame: .zero, camera: camera)
        self.view = mapView
//        mapView.mapType = .satellite
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 49.28273, longitude: -123.120735)
        marker.title = "Vancouver"
        marker.snippet = "Canada"
        marker.map = mapView

        print(GMSServices.openSourceLicenseInfo())
    }


}

