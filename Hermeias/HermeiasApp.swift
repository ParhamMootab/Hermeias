//
//  HermeiasApp.swift
//  Hermeias
//
//  Created by Parham Shagerdmootab on 2022-10-17.
//

import SwiftUI

@main
struct HermeiasApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(routeManager: RouteManager())
        }
    }
}
