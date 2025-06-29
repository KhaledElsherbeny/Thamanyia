//
//  HomeSectionUIModel.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation

struct SectionUIModel {
    var id = UUID()
    var name: String?
    var contentType: ContentTypeEnum?
    var type: DisplayTypeEnum?
    var order: Int?
    var content: [SectionContent]?
}


struct SectionContent: Equatable , Hashable {
    var id: String = UUID().uuidString
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

enum DisplayTypeEnum: String {
    case bigSquareWithDash = "big_square"
    case bigSquare = "big square"
    case square
    case queue
    case TwoLinesGrid = "2_lines_grid"
    
    init?(raw: String?) {
        guard let raw = raw?.lowercased() else { return nil }
        self.init(rawValue: raw)
    }
}

enum ContentTypeEnum: String {
    case podcast
    case episode
    case audioBooks = "audio_book"
    case audioArticle = "audio_article"
    
    init?(raw: String?) {
        guard let raw = raw?.lowercased() else { return nil }
        self.init(rawValue: raw)
    }
}
