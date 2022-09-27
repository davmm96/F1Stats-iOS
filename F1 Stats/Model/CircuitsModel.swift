//
//  CircuitsModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 27/9/22.
//

import Foundation

struct CircuitsDataModel: Decodable {
    let circuits: [CircuitDataModel]
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.circuits = try container.decode([CircuitDataModel].self, forKey: .response)
    }
}
 
struct CircuitDataModel: Decodable  {
    let id: Int
    let name: String?
    let image: String?
    let competition: CompetitionDataModel
    let first_grand_prix: Int?
    let laps: Int?
    let length: String?
    let race_distance: String?
    let lap_record: LapRecordDataModel?
    let capacity: Int?
    let opened: Int?
    let owner: String?
}

struct LapRecordDataModel: Decodable  {
    let time: String?
    let driver: String?
    let year: String?
}
