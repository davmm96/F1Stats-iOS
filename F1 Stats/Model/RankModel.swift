//
//  RankModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import Foundation

struct RankingDataModel: Decodable {
    let rank: [PositionDataModel]
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rank = try container.decode([PositionDataModel].self, forKey: .response)
    }
}

struct PositionDataModel: Decodable  {
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
