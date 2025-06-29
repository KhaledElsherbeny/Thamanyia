//
//  SearchResultDTO.swift
//  Thamanyia
//
//  Created by Khalid on 29/06/2025.
//

import Foundation

struct SearchResultDTO: Codable {
    let sections: [SearchResultSectionDTO]
}

// MARK: - Section
struct SearchResultSectionDTO: Codable {
    let name, type, contentType, order: String
    let content: [SearchResultContent]

    enum CodingKeys: String, CodingKey {
        case name, type
        case contentType = "content_type"
        case order, content
    }
}

// MARK: - Content
struct SearchResultContent: Codable {
    let podcastID, name, description: String
    let avatarURL: String
    let episodeCount, duration, language, priority: String
    let popularityScore, score: String

    enum CodingKeys: String, CodingKey {
        case podcastID = "podcast_id"
        case name, description
        case avatarURL = "avatar_url"
        case episodeCount = "episode_count"
        case duration, language, priority, popularityScore, score
    }
}
