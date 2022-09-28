//
//  APIService.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import Foundation

final class APIService: ObservableObject {
    
    @Published var races: [RaceDataModel] = []
    @Published var pastRaces: [RaceDataModel] = []
    @Published var rankingDrivers: [PositionDriverDataModel] = []
    @Published var rankingTeams: [PositionTeamDataModel] = []
    @Published var circuits: [CircuitDataModel] = []
    
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
    
    func getPastRaces(){
        
        guard let url = URL(string: Environment.urlBase + Environment.urlPastRaces) else {
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
                    self.pastRaces = racesDataModel.races
                }
            }
        }.resume()
    }
    
    func getRankDrivers(){
        
        guard let url = URL(string: Environment.urlBase + Environment.urlRankDrivers) else {
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
                let rankDriversDataModel = try! JSONDecoder().decode(RankingDriversDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.rankingDrivers = rankDriversDataModel.rank
                }
            }
        }.resume()
    }
    
    func getRankTeams(){
        
        guard let url = URL(string: Environment.urlBase + Environment.urlRankTeams) else {
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
                let rankTeamsDataModel = try! JSONDecoder().decode(RankingTeamsDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.rankingTeams = rankTeamsDataModel.rankTeams
                }
            }
        }.resume()
    }
    
    func getRank(){
        
        guard let url = URL(string: Environment.urlBase + Environment.urlRankDrivers) else {
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
                let rankDriversDataModel = try! JSONDecoder().decode(RankingDriversDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.rankingDrivers = rankDriversDataModel.rank
                }
            }
        }.resume()
    }
    
    func getCircuits(){
        
        guard let url = URL(string: Environment.urlBase + Environment.urlCircuits) else {
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
                let circuitsDataModel = try! JSONDecoder().decode(CircuitsDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.circuits = circuitsDataModel.circuits
                }
            }
        }.resume()
    }
}
