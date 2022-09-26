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
        static let urlRank = "URL_RANK"
        static let urlRaces = "URL_RACES"
        static let urlCircuits = "URL_CIRCUITS"
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
    
    static let urlRank: String = {
        guard let urlRankString = Environment.infoDictionary[Keys.urlRank] as? String else {
            fatalError("Url rank not set")
        }
        return urlRankString
    }()
    
    static let urlRaces: String = {
        guard let urlRacesString = Environment.infoDictionary[Keys.urlRaces] as? String else {
            fatalError("Url races not set")
        }
        return urlRacesString
    }()
    
    static let urlCircuits: String = {
        guard let urlCircuitsString = Environment.infoDictionary[Keys.urlCircuits] as? String else {
            fatalError("Url circuits not set")
        }
        return urlCircuitsString
    }()
    
}
