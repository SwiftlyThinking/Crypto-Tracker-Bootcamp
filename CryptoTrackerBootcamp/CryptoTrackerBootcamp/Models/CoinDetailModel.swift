//
//  CoinDetailModel.swift
//  CryptoTrackerBootcamp
//
//  Created by Mykyta Kuzminov on 19.03.2024.
//

import Foundation

struct CoinDetailModel: Codable {
    let id, symbol, name: String?
    let blockTimeInMinutes: Int?
    let hashingAlgorithm: String?
    let description: Description?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case blockTimeInMinutes = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
        case description, links
    }
    
    var readableDescription: String? {
        return description?.en.removingHTMLOccurances
    }
}

struct Description: Codable {
    let en: String
}

struct Links: Codable {
    let homepage: [String]
    let subredditURL: String

    enum CodingKeys: String, CodingKey {
        case homepage
        case subredditURL = "subreddit_url"
    }
}
