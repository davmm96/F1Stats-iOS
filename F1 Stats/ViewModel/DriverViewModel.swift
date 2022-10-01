//
//  RacesViewModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 20/09/22.
//

import Foundation

final class DriverViewModel: ObservableObject {
    
    @Published var driver: [DriverDetailDataModel] = []
    
    func getDriver(id: Int){
        
        let idString = "\(id)"
        
        guard let url = URL(string: EnvironmentData.urlBase + EnvironmentData.urlDriver + idString) else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(EnvironmentData.apiKey, forHTTPHeaderField: EnvironmentData.apiKeyHeader)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let driverDataModel = try! JSONDecoder().decode(DriverResponseDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.driver = driverDataModel.driver
                }
            }
        }.resume()
    }
}

