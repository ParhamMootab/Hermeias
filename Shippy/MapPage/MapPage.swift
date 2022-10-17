//
//  MapPage.swift
//  Shippy
//
//  Created by Parham Shagerdmootab on 2022-10-16.
//

import GoogleMaps
import SwiftUI

struct MapPage: View {
    

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func getMap(){
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.body, camera: camera)
        
    }
}

struct MapPage_Previews: PreviewProvider {
    static var previews: some View {
        MapPage()
    }
}
