//
//  MapPage.swift
//  Hermeias
//
//  Created by Parham Shagerdmootab on 2022-10-16.
//


import SwiftUI


struct MapPage: View {
    @ObservedObject var routeManager: RouteManager
    
    var body: some View {
        
        VStack {
            ZStack { 
                MapStoryboard()
                VStack {
                    Spacer()
                        .frame(height: 450)
                    HStack {
                        Spacer()
                        HStack{
                            Image(systemName: "location.fill")
                                .resizable()
                                .frame(width: 30.0, height: 30.0)
                                .background(Color.white)
                                .clipShape(Circle())
 
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            HStack{
                VStack{
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .frame(width: 25.0, height: 30.0)
                        
                    Text("Save")
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Spacer()
                    .frame(width: 100.0)
                
                VStack{
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                    Button {
                        routeManager.sendRequest()
                        print(routeManager.response)
                    } label: {
                        Text("New")
                    }
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct MapPage_Previews: PreviewProvider {
    static var previews: some View {
        MapPage(routeManager: RouteManager())
    }
}

