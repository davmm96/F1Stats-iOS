//
//  RacesViewModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 20/09/22.
//

import Foundation

final class RacesViewModel: ObservableObject {
    
    @Published var races: [RaceDataModel] = []
    @Published var pastRaces: [RaceDataModel] = []
    
    func getRaces() {
        
        guard let url = URL(string: EnvironmentData.urlBase + EnvironmentData.urlRaces) else {
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
                let racesDataModel = try! JSONDecoder().decode(RacesDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.races = racesDataModel.races
                }
            }
        }.resume()
    }
    
    func getPastRaces(){
        
        guard let url = URL(string: EnvironmentData.urlBase + EnvironmentData.urlPastRaces) else {
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
                let racesDataModel = try! JSONDecoder().decode(RacesDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.pastRaces = racesDataModel.races
                }
            }
        }.resume()
    }
}

