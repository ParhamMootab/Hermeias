//
//  ContentView.swift
//  Hermeias
//
//  Created by Parham Shagerdmootab on 2022-10-17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var routeManager: RouteManager
    var body: some View {
        MapPage(routeManager: routeManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(routeManager: RouteManager())
    }
}
