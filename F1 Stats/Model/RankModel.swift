//
//  RankModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import Foundation

struct RankingDriversDataModel: Decodable {
    let rank: [PositionDriverDataModel]
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rank = try container.decode([PositionDriverDataModel].self, forKey: .response)
    }
}

struct PositionDriverDataModel: Decodable  {
    let position: Int
    let driver: DriverDataModel
    let team: TeamDataModel
    let points: Int?
    let wins: Int?
    let behind: Int?
    let season: Int?
    
    static let example = PositionDriverDataModel(
                            position: 1,
                            driver: DriverDataModel(id: 1, name: "Max Verstappen", abbr: "Ver", number: 1, image: ""),
                            team: TeamDataModel(id: 1, name: "Red Bull Racing", logo: ""),
                            points: 355, wins: 17,
                            behind: nil,
                            season: 2022)
}

struct DriverDataModel: Decodable  {
    let id: Int
    let name: String?
    let abbr: String?
    let number: Int?
    let image: String?
    
    static let example = DriverDataModel(id: 1, name: "Max Verstappen", abbr: "Ver", number: 1, image: "")
}

struct TeamDataModel: Decodable  {
    let id: Int
    let name: String?
    let logo: String?
}

struct RankingTeamsDataModel: Decodable {
    let rankTeams: [PositionTeamDataModel]
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rankTeams = try container.decode([PositionTeamDataModel].self, forKey: .response)
    }
}

struct PositionTeamDataModel: Decodable  {
    let position: Int
    let team: TeamDataModel
    let points: Int?
    let season: Int?
    
    static let example = PositionTeamDataModel(
                            position: 1,
                            team: TeamDataModel(id: 1, name: "Red Bull Racing", logo: ""),
                            points: 560,
                            season: 2022)
}

