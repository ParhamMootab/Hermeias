//
//  RouteManager.swift
//  Hermeias
//
//  Created by Parham Shagerdmootab on 2022-10-20.
//

import Foundation
import SwiftUI
import Combine

class RouteManager: ObservableObject {
    var url:String
    @Published var response:Route?

    init(){
        self.url = "https://flask-fire-mox6xhvzoq-vp.a.run.app/api/demo"
        self.response = nil
    }

    func sendRequest(){
        guard let url = URL(string: "https://flask-fire-mox6xhvzoq-vp.a.run.app/api/demo") else { fatalError() }
        let request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONSerialization.data(withJSONObject: [], options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { (data, httpResponse, error) -> Void in
            if error != nil {
                print("Error sending request to API")
                return
            }
            
            guard let httpResponse = httpResponse as? HTTPURLResponse else {return}

            if httpResponse.statusCode == 200 {
                guard let data = data else {
                    return
                }
                
                DispatchQueue.main.async {
                    do{
                        let decodedData = try JSONDecoder().decode(Route.self, from: data)
                        self.response = decodedData
                    }catch let error{
                        print(error)
                    }
                    
                }

            }
        }
        task.resume()
    }
    
}
    

