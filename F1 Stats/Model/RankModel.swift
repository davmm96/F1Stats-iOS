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
}

struct DriverDataModel: Decodable  {
    let id: Int
    let name: String?
    let abbr: String?
    let number: Int?
    let image: String?
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
}

