//
//  DestinationMenuPage.swift
//  Hermeias
//
//  Created by Parham Shagerdmootab on 2022-10-16.
//

import SwiftUI

struct DestinationMenuPage: View {
    @StateObject var mapSearch = MapSearch()
    @State var isLocationOn = false
    var body: some View {
        VStack {
            
            Spacer()
            ForEach(0..<5){ item in
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    TextField("Address...", text: $mapSearch.searchTerm).cornerRadius(15)
                    
                    
                            
                    
                    Spacer()
                    Button{
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    } label: {
                        Image(systemName: "trash.circle.fill")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundColor(.black)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                .frame(width: 350.0, height: 50.0)
                .background(Color.green
                .clipShape(RoundedRectangle(cornerRadius:20)))
                Spacer().frame(height: 25)
            }
            
            ForEach(mapSearch.locationResults, id: \.self) { location in
                Button {
                    isLocationOn.toggle()
                    print("Location")
                } label: {
                    VStack(alignment: .leading) {
                        Text(location.title)
                            .foregroundColor(Color.black)
                        Text(location.subtitle)
                            .font(.system(.caption))
                            .foregroundColor(Color.white)
                    }
                }
            }
            
            Button {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
            }
            
            Spacer()
                
            
            
            Button("Let's Go") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding([.top, .bottom])
            .frame(maxWidth: .infinity)
            .background(.blue)
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            .clipShape(Capsule())
            
        }
        
    }
}

struct DestinationMenuPage_Previews: PreviewProvider {
    static var previews: some View {
        DestinationMenuPage()
    }
}
