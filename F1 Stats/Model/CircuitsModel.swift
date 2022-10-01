//
//  CircuitsModel.swift
//  F1 Stats
//
//  Created by David Melero Morant on 07/9/22.
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
    
    static let example = CircuitDataModel(
                            id: 1,
                            name: "Albert Park",
                            image: "",
                            competition: CompetitionDataModel(id: 2, name: "Australia Grand Prix", location: LocationDataModel(country: "Australia", city: "Melbourne")),
                            first_grand_prix: 1966,
                            laps: 57,
                            length: "5327 km",
                            race_distance: "1",
                            lap_record: LapRecordDataModel(time: "1.26.156", driver: "Michael Schumacher", year: "2001"),
                            capacity: 36000,
                            opened: 1982,
                            owner: "Owner")
}

struct LapRecordDataModel: Decodable  {
    let time: String?
    let driver: String?
    let year: String?
}
