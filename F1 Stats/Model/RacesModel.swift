//
//  RankModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 06/9/22.
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
    let circuit: CircuitRaceDataModel
    let season: Int?
    let type: String?
    let laps: LapsDataModel
    let fastest_lap: FastestLapDataModel
    let distance: String?
    let timezone: String?
    let date: String?
    let weather: String?
    let status: String?
    
    static let example = RaceDataModel(
        id: 1,
        competition: CompetitionDataModel(id: 1, name: "Albert Park",location: LocationDataModel(country: "Spain", city: "Barcelona")),
        circuit: CircuitRaceDataModel(id: 1, name: "Marina Bay Street Circuit", image: ""),
        season: 2022,
        type: "Race",
        laps: LapsDataModel(current: 54, total: 70),
        fastest_lap: FastestLapDataModel(driver: nil, time: ""),
        distance: "4567 km",
        timezone: "",
        date: "",
        weather: "",
        status: "Scheduled")
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

struct CircuitRaceDataModel: Decodable  {
    let id: Int
    let name: String?
    let image: String?
}

struct LapsDataModel: Decodable  {
    let current: Int?
    let total: Int
}

struct FastestLapDataModel: Decodable  {
    let driver: DriverLapDataModel?
    let time: String?
}

struct DriverLapDataModel: Decodable {
    let id: Int?
}

enum StatusRace: String, CaseIterable{
    case completed = "Completed"
    case scheduled = "Scheduled"
    case cancelled = "Cancelled"
}

