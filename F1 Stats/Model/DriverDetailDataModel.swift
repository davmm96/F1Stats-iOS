//
//  RankModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import Foundation

struct DriverResponseDataModel: Decodable {
    let driver: [DriverDetailDataModel]
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.driver = try container.decode([DriverDetailDataModel].self, forKey: .response)
    }
}

struct DriverDetailDataModel: Decodable  {
    let id: Int
    let name: String?
    let abbr: String?
    let image: String?
    let nationality: String?
    let country: CountryDataModel?
    let birthdate: String?
    let birthplace: String?
    let number: Int?
    let grands_prix_entered: Int?
    let world_championships: Int?
    let podiums: Int?
    let highest_race_finish: HighestRaceDataModel?
    let highest_grid_position: Int?
    let career_points: String?
    let teams: [HistoricTeamDataModel]
    
    static let example = DriverDetailDataModel(id: 1, name: "", abbr: "", image: "", nationality: "", country: CountryDataModel(name: "", code: ""), birthdate: "", birthplace: "", number: 1, grands_prix_entered: 1, world_championships: 1, podiums: 1, highest_race_finish: HighestRaceDataModel(position: 0, number: 0), highest_grid_position: 0, career_points: "", teams: [])
}

struct CountryDataModel: Decodable {
    let name: String?
    let code: String?
}

struct HighestRaceDataModel: Decodable {
    let position: Int?
    let number: Int?
}

struct HistoricTeamDataModel: Decodable {
    let season: Int?
    let team: TeamDataModel?
}


