//
//  RankModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import Foundation

struct RacesDataModel: Decodable {
    let races: [RaceDataModel]
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.races = try container.decode([RaceDataModel].self, forKey: .response)
    }
}
 
struct RaceDataModel: Decodable  {
    let id: Int
    let competition: CompetitionDataModel
    let circuit: CircuitDataModel
    let season: Int?
    let type: String?
    let laps: LapsDataModel
    let fastest_lap: FastestLapDataModel
    let distance: String?
    let timezone: String?
    let date: String?
    let weather: String?
    let status: String?
}

struct CompetitionDataModel: Decodable  {
    let id: Int
    let name: String?
    let location: LocationDataModel
}

struct LocationDataModel: Decodable  {
    let country: String?
    let city: String?
}

struct CircuitDataModel: Decodable  {
    let id: Int
    let name: String?
    let image: String?
}

struct LapsDataModel: Decodable  {
    let current: Int?
    let total: Int?
}

struct FastestLapDataModel: Decodable  {
    let driver: DriverLapDataModel?
    let time: String?
}

struct DriverLapDataModel: Decodable {
    let id: Int?
}
