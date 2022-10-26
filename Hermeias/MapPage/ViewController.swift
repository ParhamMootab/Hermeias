//
//  ViewController.swift
//  MapStory
//
//  Created by Parham Shagerdmootab on 2022-10-17.
//

import UIKit
import GoogleMaps
import GooglePlaces

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
        makeButton()
    }
    
    // Present the Autocomplete view controller when the button is pressed.
      @objc func autocompleteClicked(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self

        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                                  UInt(GMSPlaceField.placeID.rawValue))
        autocompleteController.placeFields = fields

        // Specify a filter.
        let filter = GMSAutocompleteFilter()
          filter.types = []
        autocompleteController.autocompleteFilter = filter

        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
      }

      // Add a button to the view.
      func makeButton() {
        let btnLaunchAc = UIButton(frame: CGRect(x: 5, y: 150, width: 300, height: 35))
        btnLaunchAc.backgroundColor = .blue
        btnLaunchAc.setTitle("Launch autocomplete", for: .normal)
        btnLaunchAc.addTarget(self, action: #selector(autocompleteClicked), for: .touchUpInside)
        self.view.addSubview(btnLaunchAc)
      }


}

extension ViewController: GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    print("Place name: \(place.name)")
    print("Place ID: \(place.placeID)")
    print("Place attributions: \(place.attributions)")
    dismiss(animated: true, completion: nil)
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }

}

