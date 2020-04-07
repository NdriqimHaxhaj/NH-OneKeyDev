//
//  Joke.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/8/20.
//

import Foundation

// MARK: - Joke
struct Joke: Codable {
    let iconURL: String?
    let id: String?
    let url: String?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case id, url, value
    }
}

