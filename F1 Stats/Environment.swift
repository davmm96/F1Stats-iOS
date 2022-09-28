//
//  Environment.swift
//  F1 Stats
//
//  Created by David Melero Morant on 26/9/22.
//

import Foundation


public enum Environment {
    enum Keys {
        static let apiKey = "API_KEY"
        static let apiKeyHeader = "API_KEY_HEADER"
        static let urlBase = "URL_BASE"
        static let urlRankDrivers = "URL_RANK_DRIVERS"
        static let urlRankTeams = "URL_RANK_TEAMS"
        static let urlRaces = "URL_RACES"
        static let urlPastRaces = "URL_PAST_RACES"
        static let urlCircuits = "URL_CIRCUITS"
        static let urlDriver = "URL_DRIVER"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    static let apiKey: String = {
        guard let apiKeyString = Environment.infoDictionary[Keys.apiKey] as? String else {
            fatalError("Api key not set")
        }
        return apiKeyString
    }()
    
    static let apiKeyHeader: String = {
        guard let apiKeyHeaderString = Environment.infoDictionary[Keys.apiKeyHeader] as? String else {
            fatalError("Api key header not set")
        }
        return apiKeyHeaderString
    }()
    
    static let urlBase: String = {
        guard let urlBaseString = Environment.infoDictionary[Keys.urlBase] as? String else {
            fatalError("Url base not set")
        }
        return urlBaseString
    }()
    
    static let urlRankDrivers: String = {
        guard let urlRankDriversString = Environment.infoDictionary[Keys.urlRankDrivers] as? String else {
            fatalError("Url rank drivers not set")
        }
        return urlRankDriversString
    }()
    
    static let urlRankTeams: String = {
        guard let urlRankTeamsString = Environment.infoDictionary[Keys.urlRankTeams] as? String else {
            fatalError("Url rank teams not set")
        }
        return urlRankTeamsString
    }()
    
    static let urlRaces: String = {
        guard let urlRacesString = Environment.infoDictionary[Keys.urlRaces] as? String else {
            fatalError("Url races not set")
        }
        return urlRacesString
    }()
    
    static let urlPastRaces: String = {
        guard let urlPastRacesString = Environment.infoDictionary[Keys.urlPastRaces] as? String else {
            fatalError("Url races not set")
        }
        return urlPastRacesString
    }()
    
    static let urlCircuits: String = {
        guard let urlCircuitsString = Environment.infoDictionary[Keys.urlCircuits] as? String else {
            fatalError("Url circuits not set")
        }
        return urlCircuitsString
    }()
    
    static let urlDriver: String = {
        guard let urlDriverString = Environment.infoDictionary[Keys.urlDriver] as? String else {
            fatalError("Url driver not set")
        }
        return urlDriverString
    }()
    
}
