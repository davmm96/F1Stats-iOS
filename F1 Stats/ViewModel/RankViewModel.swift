//
//  RacesViewModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 20/09/22.
//

import Foundation

final class RankViewModel: ObservableObject {
    
    @Published var rankingDrivers: [PositionDriverDataModel] = []
    @Published var rankingTeams: [PositionTeamDataModel] = []
    
    func getRankDrivers(){
        
        guard let url = URL(string: EnvironmentData.urlBase + EnvironmentData.urlRankDrivers) else {
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
                let rankDriversDataModel = try! JSONDecoder().decode(RankingDriversDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.rankingDrivers = rankDriversDataModel.rank
                }
            }
        }.resume()
    }
    
    func getRankTeams(){
        
        guard let url = URL(string: EnvironmentData.urlBase + EnvironmentData.urlRankTeams) else {
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
                let rankTeamsDataModel = try! JSONDecoder().decode(RankingTeamsDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.rankingTeams = rankTeamsDataModel.rankTeams
                }
            }
        }.resume()
    }
}

