//
//  MapView.swift
//  Hermeias
//
//  Created by Parham Shagerdmootab on 2022-10-17.
//

import UIKit
import SwiftUI

struct MapStoryboard : UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "MapView")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
}

