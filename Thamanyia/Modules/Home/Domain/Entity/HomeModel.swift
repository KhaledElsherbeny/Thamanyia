//
//  HomeModel.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation

// MARK: - HomeModel

struct HomeModel {
    var sections: [SectionModel]?
    var pagination: PaginationModel?
}

// MARK: - Pagination

struct PaginationModel {
    var nextPage: String?
    var totalPages: Int?
}

// MARK: - Section

struct SectionModel {
    var name, type, contentType: String?
    var order: Int?
    var content: [ContentModel]?
}

// MARK: - Content

struct ContentModel {
    var podcastID, name, description: String?
    var avatarURL: String?
    var episodeCount, duration: Int?
    var language: String?
    var priority, popularityScore: Int?
    var score: Double?
    var podcastPopularityScore, podcastPriority: Int?
    var episodeID: String?
    var seasonNumber: Int?
    var episodeType: String?
    var podcastName: String?
    var authorName: String?
    var number: Int?
    var separatedAudioURL, audioURL: String?
    var releaseDate: String?
    var chapters: [String]?
    var paidIsEarlyAccess, paidIsNowEarlyAccess, paidIsExclusive: Bool?
    var paidTranscriptURL, freeTranscriptURL: String?
    var paidIsExclusivePartially: Bool?
    var paidExclusiveStartTime: Int?
    var paidEarlyAccessDate, paidEarlyAccessAudioURL, paidExclusivityType: String?
    var audiobookID: String?
    var articleID: String?
}
