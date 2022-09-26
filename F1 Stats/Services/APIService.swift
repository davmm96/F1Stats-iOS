//
//  APIService.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import Foundation

final class APIService: ObservableObject {
    
    @Published var ranking: [PositionDataModel] = []
    @Published var races: [RaceDataModel] = []
    
    func getRank(){
        
        guard let url = URL(string: Environment.urlBase + Environment.urlRank) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(Environment.apiKey, forHTTPHeaderField: Environment.apiKeyHeader)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let rankDataModel = try! JSONDecoder().decode(RankingDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.ranking = rankDataModel.rank
                }
            }
        }.resume()
    }
    
    func getRaces(){
        
        guard let url = URL(string: Environment.urlBase + Environment.urlRaces) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(Environment.apiKey, forHTTPHeaderField: Environment.apiKeyHeader)
        
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
}
